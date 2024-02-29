import 'dart:async';

import 'package:environment_hackaton/game/behaviors/individual_drag_behavior.dart';
import 'package:environment_hackaton/game/behaviors/player_state_behavior.dart';
import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

enum DpadPositionState {
  middle,
  up,
  down,
  left,
  right,
}

class DpadEntity extends HudMarginComponent {
  DpadEntity({
    required this.dpadEntities,
  }) : super(
        /* 
          behaviors: [
            DpadDragBehavior(dpadEntities: dpadEntities),
          ],
         */
        );

  final List<IndividualDpadEntity> dpadEntities;

  // @override
  // FutureOr<void> onLoad() {
  //   for (final button in dpadEntities) {
  //     switch (button.dpadState) {
  //       case DpadPositionState.middle:
  //         button.position = middleSpritePosition;
  //       // ..button!.size = Vector2(82, 82);
  //       case DpadPositionState.up:
  //         button.position = topSpritePosition;
  //       // ..button!.size = Vector2(80, 82);
  //       case DpadPositionState.down:
  //         button.position = bottomSpritePosition;
  //       // ..button!.size = Vector2(80, 82);
  //       case DpadPositionState.left:
  //         button.position = leftSpritePosition;
  //       // ..button!.size = Vector2(82, 80);
  //       case DpadPositionState.right:
  //         button.position = rightSpritePosition;
  //       // ..button!.size = Vector2(82, 80);
  //     }
  //   }

  //   addAll(dpadEntities);
  //   return super.onLoad();
  // }
}

class IndividualDpadEntity extends HudButtonComponent with EntityMixin {
  IndividualDpadEntity({
    required this.player,
    required this.dpadState,
    required this.buttonAsset,
    required this.buttonDownAsset,
    super.position,
    super.size,
    super.priority,
    super.onPressed,
    super.onReleased,
  }) : super(
          anchor: Anchor.topLeft,
          button: DpadSprite(
            sprite: Sprite(
              buttonAsset,
            ),
            size: size,
          ),
          buttonDown: DpadSprite(
            sprite: Sprite(
              buttonDownAsset,
            ),
            size: size,
          ),
        );

  final Player player;

  late final IndividualDragBehavior stateBehavior =
      findBehavior<IndividualDragBehavior>();

  final Image buttonAsset;
  final Image buttonDownAsset;

  final DpadPositionState dpadState;

  final middleSpritePosition = Vector2(150, 520);

  late Vector2 topSpritePosition = Vector2.copy(middleSpritePosition)..y -= 80;
  late Vector2 bottomSpritePosition = Vector2.copy(middleSpritePosition)
    ..y += 82;
  late Vector2 leftSpritePosition = Vector2.copy(middleSpritePosition)..x -= 80;
  late Vector2 rightSpritePosition = Vector2.copy(middleSpritePosition)
    ..x += 80;

  @override
  Future<void> onLoad() {
    debugMode = true;
    // Set up positioning for D-pad Sprites
    switch (dpadState) {
      case DpadPositionState.middle:
        position = middleSpritePosition;
      case DpadPositionState.up:
        position = topSpritePosition;
      case DpadPositionState.down:
        position = bottomSpritePosition;
      case DpadPositionState.left:
        position = leftSpritePosition;
      case DpadPositionState.right:
        position = rightSpritePosition;
    }
    add(
      IndividualDragBehavior(),
    );
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    switch (dpadState) {
      case DpadPositionState.middle:
        break;
      case DpadPositionState.up:
        player.directionState = DirectionState.up;
      case DpadPositionState.down:
        player.directionState = DirectionState.down;
      case DpadPositionState.left:
        player.directionState = DirectionState.left;
      case DpadPositionState.right:
        player.directionState = DirectionState.right;
    }
    if (dpadState != DpadPositionState.middle) {
      player.setMovementState(
        isMoving: true,
      );
    }
    super.onTapDown(event);
  }

  @override
  void Function()? get onReleased {
    player.setMovementState(
      isMoving: false,
    );
    return super.onReleased;
  }
}

class DpadSprite extends SpriteComponent with HasGameRef<WattsChallenge> {
  DpadSprite({
    super.sprite,
    super.size,
    super.position,
  }) : super(
          anchor: Anchor.topLeft,
        );
}

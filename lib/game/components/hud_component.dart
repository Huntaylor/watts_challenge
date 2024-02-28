import 'dart:async';

import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';

enum DpadPositionState {
  middle,
  up,
  down,
  left,
  right,
}

class DpadComponent extends HudButtonComponent {
  DpadComponent({
    required this.dpadSprite,
    required this.dpadDownSprite,
    required this.dpadState,
    super.position,
    super.size,
    super.priority,
    super.onPressed,
    super.onReleased,
  }) : super(
          anchor: Anchor.topLeft,
          button: dpadSprite,
          buttonDown: dpadDownSprite,
        );

  final DpadSprite dpadSprite;
  final DpadSprite dpadDownSprite;
  final DpadPositionState dpadState;

  @override
  Future<void> onLoad() {
    switch (dpadState) {
      case DpadPositionState.middle:
        position = Vector2(150, 520);
      case DpadPositionState.up:
        position = Vector2(150, 441);
      case DpadPositionState.down:
        position = Vector2(150, 599);
      case DpadPositionState.left:
        position = Vector2(71, 520);
      case DpadPositionState.right:
        position = Vector2(229, 520);
    }
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (dpadState != DpadPositionState.middle) {
      _getDirection(dpadSprite.game.player, dpadState);
    }
    super.onTapDown(event);
  }

  void _getDirection(Player player, DpadPositionState dpadState) {
    switch (dpadState) {
      case DpadPositionState.middle:
        break;
      case DpadPositionState.up:
        player.movePlayer(
          state: DirectionState.back,
        );
      case DpadPositionState.down:
        player.movePlayer(
          state: DirectionState.forward,
        );
      case DpadPositionState.left:
        player.movePlayer(
          state: DirectionState.left,
        );
      case DpadPositionState.right:
        player.movePlayer(
          state: DirectionState.right,
        );
    }
  }

  @override
  void Function()? get onReleased {
    final player = dpadSprite.game.player;
    switch (dpadState) {
      case DpadPositionState.middle:
        break;
      case DpadPositionState.up:
        player.stopPlayer(
          state: DirectionState.back,
        );
      case DpadPositionState.down:
        player.stopPlayer(
          state: DirectionState.forward,
        );
      case DpadPositionState.left:
        player.stopPlayer(
          state: DirectionState.left,
        );
      case DpadPositionState.right:
        player.stopPlayer(
          state: DirectionState.right,
        );
    }
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

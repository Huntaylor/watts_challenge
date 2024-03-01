import 'dart:async';

import 'package:environment_hackaton/game/behaviors/player_controller_behavior.dart';
import 'package:environment_hackaton/game/behaviors/player_state_behavior.dart';
import 'package:environment_hackaton/game/components/utils.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<WattsChallenge>, KeyboardHandler, EntityMixin {
  Player({
    super.position,
    super.current,
    super.anchor,
  }) : super(
          priority: 1,
          size: Vector2(65, 72),
        );

  late final PlayerStateBehavior stateBehavior =
      findBehavior<PlayerStateBehavior>();

  late final PlayerControllerBehavior controllerBehavior =
      findBehavior<PlayerControllerBehavior>();

  late RectangleHitbox hitbox;
  late PlayerState playerState;
  late DirectionState directionState;

  late bool isWalkingLeft;
  late bool isWalkingRight;
  late bool isWalkingForward;
  late bool isWalkingBack;

  final Vector2 direction = Vector2.zero();

  double stepTime = 0.5;
  double walkingStepTime = 0.15;
  double fixedDeltaTime = 1 / 60;
  double accumulatedTime = 0;
  double moveSpeed = 200;
  double horizontalMovement = 0;
  double verticalMovement = 0;

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    add(PlayerStateBehavior());
    add(PlayerControllerBehavior());
    hitbox = RectangleHitbox(
      size: size,
      isSolid: true,
    );
    add(hitbox);
    playerState = PlayerState.idleForward;
    directionState = DirectionState.down;
    isWalkingForward = true;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement = direction.normalized() * moveSpeed * dt;

    position.add(displacement);

    _checkHorizontalCollisions();
    _checkVerticalCollisions();

    super.update(dt);
  }

  void _checkHorizontalCollisions() {
    for (final block in game.level.collisionBlock) {
      if (checkCollisions(
        player: this,
        block: block,
      )) {
        if (direction.x > 0) {
          position.x = block.x - hitbox.x - hitbox.width;
        }
        if (direction.x < 0) {
          position.x = block.x + block.width + hitbox.x;
        }
      }
    }
  }

  void _checkVerticalCollisions() {
    for (final block in game.level.collisionBlock) {
      if (checkCollisions(
        player: this,
        block: block,
      )) {
        if (direction.y > 0) {
          position.y = block.y - hitbox.y - hitbox.height;
        }
        if (direction.y < 0) {
          position.y = block.y + block.height + hitbox.y;
        }
      }
    }
  }

  void setMovementState({
    required bool isMoving,
  }) {
    final PlayerState playerState;
    switch (directionState) {
      // The Left direction
      case DirectionState.left:
        if (isMoving) {
          playerState = PlayerState.walkingLeft;
          controllerBehavior.movePlayer(state: directionState);
        } else {
          controllerBehavior.stopPlayer();
          playerState = PlayerState.idleLeft;
        }

      // The Right direction
      case DirectionState.right:
        if (isMoving) {
          playerState = PlayerState.walkingRight;
          controllerBehavior.movePlayer(state: directionState);
        } else {
          controllerBehavior.stopPlayer();
          playerState = PlayerState.idleRight;
        }

      // The Forward direction
      case DirectionState.down:
        if (isMoving) {
          controllerBehavior.movePlayer(state: directionState);
          playerState = PlayerState.walkingForward;
        } else {
          controllerBehavior.stopPlayer();
          playerState = PlayerState.idleForward;
        }

      // The Back direction
      case DirectionState.up:
        if (isMoving) {
          controllerBehavior.movePlayer(state: directionState);
          playerState = PlayerState.walkingBack;
        } else {
          controllerBehavior.stopPlayer();
          playerState = PlayerState.idleBack;
        }
    }

    stateBehavior.state = playerState;
  }
}

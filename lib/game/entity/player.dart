import 'dart:async';

import 'package:environment_hackaton/game/behaviors/player/player_collision_behavior.dart';
import 'package:environment_hackaton/game/behaviors/player/player_controller_behavior.dart';
import 'package:environment_hackaton/game/behaviors/player/player_state_behavior.dart';
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

  late final PlayerCollisionBehavior collisionBehavior =
      findBehavior<PlayerCollisionBehavior>();

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
    add(PlayerStateBehavior());
    add(PlayerControllerBehavior());
    add(PlayerCollisionBehavior());
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
    super.update(dt);
  }
}

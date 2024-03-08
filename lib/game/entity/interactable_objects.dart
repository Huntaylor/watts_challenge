import 'dart:async';

import 'package:environment_hackaton/game/behaviors/interactables/interactable_collision_behavior.dart';
import 'package:environment_hackaton/game/behaviors/interactables/interactable_state_behavior.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableObjects extends SpriteGroupComponent<InteractableState>
    with EntityMixin, HasGameRef<WattsChallenge> {
  InteractableObjects({
    required this.lightSwitchState,
    required this.interactionTime,
    required this.onSprite,
    required this.offSprite,
    super.priority,
    super.position,
    super.size,
    super.sprites,
    super.current,
  });
  final LightSwitchState lightSwitchState;
  final int interactionTime;

  final Image onSprite;
  final Image offSprite;

  late InteractableState deviceState;
  late RectangleHitbox hitbox;
  late bool isOn;

  late bool isPlayerColliding;

  late final InteractableBehaviorState interactableBehaviorState =
      findBehavior<InteractableBehaviorState>();

  late final PropagatingCollisionBehavior propagatingCollisionBehavior =
      findBehavior<PropagatingCollisionBehavior>();

  late final InteractableCollisionBehavior interactableCollisionBehavior =
      findBehavior<InteractableCollisionBehavior>();

  @override
  FutureOr<void> onLoad() async {
    isPlayerColliding = false;
    isOn = false;
    hitbox = RectangleHitbox.relative(
      Vector2.all(1),
      parentSize: size,
      anchor: Anchor.center,
    );

    add(hitbox);

    priority = gameRef.interactablePriority;
    deviceState = InteractableState.on;

    await addAll([
      InteractableBehaviorState(),
      InteractableCollisionBehavior(),
      PropagatingCollisionBehavior(hitbox),
    ]);

    return super.onLoad();
  }
}

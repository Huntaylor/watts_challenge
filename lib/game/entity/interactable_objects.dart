import 'dart:async';

import 'package:environment_hackaton/game/behaviors/interactables/interactable_collision_behavior.dart';
import 'package:environment_hackaton/game/behaviors/interactables/interactable_state_behavior.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableObjects extends SpriteGroupComponent<InteractableState>
    with EntityMixin, HasGameRef<WattsChallenge> {
  InteractableObjects({
    required this.interactionTime,
    required this.onSprite,
    required this.offSprite,
    super.priority,
    super.position,
    super.size,
    super.sprites,
    super.current,
  });

  late RectangleHitbox hitbox;

  final int interactionTime;

  final Image onSprite;
  final Image offSprite;

  late InteractableState deviceState;

  // late InteractionTimerBar timerBar;

  bool isPlayerColliding = false;

  late bool isOn;

  late final InteractableBehaviorState interactableBehaviorState =
      findBehavior<InteractableBehaviorState>();

  late final PropagatingCollisionBehavior propagatingCollisionBehavior =
      findBehavior<PropagatingCollisionBehavior>();

  late final InteractableCollisionBehavior interactableCollisionBehavior =
      findBehavior<InteractableCollisionBehavior>();

  @override
  FutureOr<void> onLoad() {
    // timerBar = InteractionTimerBar(
    //   anchor: Anchor.center,
    //   interactionTime: interactionTime,
    //   priority: gameRef.interactionBarPriority,
    //   position: Vector2(
    //     barPosition.x,
    //     barPosition.y + 15,
    //   ),
    // );

    isOn = false;
    hitbox = RectangleHitbox.relative(
      Vector2.all(1),
      parentSize: size,
      anchor: Anchor.center,
    );

    add(hitbox);

    priority = gameRef.interactablePriority;
    deviceState = InteractableState.on;

    addAll([
      InteractableBehaviorState(),
      InteractableCollisionBehavior(),
      PropagatingCollisionBehavior(hitbox),
    ]);

    return super.onLoad();
  }
}
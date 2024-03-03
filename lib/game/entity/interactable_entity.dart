import 'dart:async';

import 'package:environment_hackaton/game/behaviors/interactables/interactable_state_behavior.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableEntity extends SpriteGroupComponent<InteractableState>
    with EntityMixin, HasGameRef<WattsChallenge> {
  InteractableEntity({
    required this.onSprite,
    required this.offSprite,
    super.priority,
    super.position,
    super.size,
    super.sprites,
    super.current,
  });

  final Image onSprite;
  final Image offSprite;

  late InteractableState behaviorState;

  late final InteractableBehaviorState interactableBehaviorState =
      findBehavior<InteractableBehaviorState>();

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    priority = gameRef.interactablePriority;
    behaviorState = InteractableState.on;
    add(InteractableBehaviorState());
    return super.onLoad();
  }
}

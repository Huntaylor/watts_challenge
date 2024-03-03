import 'dart:async';

import 'package:environment_hackaton/game/entity/interactable_entity.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

enum InteractableState {
  on,
  off,
}

class InteractableBehaviorState extends Behavior<InteractableEntity>
    with HasGameRef<WattsChallenge> {
  InteractableState? _interactableState;

  late final Sprite onSprite;
  late final Sprite offSprite;

  InteractableState get state => _interactableState ?? InteractableState.on;

  set state(InteractableState state) {
    if (state != _interactableState) {
      _interactableState = state;
    }
  }

  @override
  FutureOr<void> onLoad() {
    _loadSprites();
    return super.onLoad();
  }

  void _loadSprites() {
    onSprite = Sprite(parent.onSprite);
    offSprite = Sprite(parent.offSprite);

    parent
      ..sprites = {
        InteractableState.on: onSprite,
        InteractableState.off: offSprite,
      }
      ..current = InteractableState.on;
  }

  void interact() {}
}

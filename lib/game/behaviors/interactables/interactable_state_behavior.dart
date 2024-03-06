import 'dart:async';

import 'package:environment_hackaton/game/entity/interactable_objects.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';

import 'package:flame_behaviors/flame_behaviors.dart';

enum InteractableState {
  on,
  off,
}

class InteractableBehaviorState extends Behavior<InteractableObjects>
    with HasGameRef<WattsChallenge> {
  late final Sprite onSprite;
  late final Sprite offSprite;

  bool hasStarted = false;

  @override
  void update(double dt) {
    _loadObjectState();
    super.update(dt);
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
      ..current = InteractableState.off;
  }

  void objectInteraction() {
    if (!hasStarted) {
      gameRef.interactionTimerBar
        ..interactionTime = parent.interactionTime
        ..startInteraction();
      hasStarted = true;
    }
  }

  void stopInteraction() {
    if (hasStarted) {
      print('stop');
      gameRef.interactionTimerBar
        ..interactionTime = parent.interactionTime
        ..cancelInteraction();
      hasStarted = false;
    }
  }

  void _loadObjectState() {
    parent.current = parent.isOn ? InteractableState.on : InteractableState.off;
  }
}

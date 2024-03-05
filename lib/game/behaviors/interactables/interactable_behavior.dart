import 'package:environment_hackaton/game/entity/interactable_objects.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableBehavior extends Behavior<InteractableObjects>
    with HasGameRef<WattsChallenge> {
  void onInteraction() {}
}

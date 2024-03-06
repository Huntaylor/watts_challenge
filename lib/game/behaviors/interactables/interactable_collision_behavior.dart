import 'package:environment_hackaton/game/behaviors/player/player.dart';
import 'package:environment_hackaton/game/entity/interactable_objects.dart';
import 'package:environment_hackaton/game/entity/player_entity.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableCollisionBehavior
    extends CollisionBehavior<Player, InteractableObjects>
    with HasGameRef<WattsChallenge> {
  InteractableCollisionBehavior();

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, Player other) {
    parent.isPlayerColliding = true;
    other.isWithinRange = true;
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(Player other) {
    other.isWithinRange = false;
    parent.isPlayerColliding = false;
    super.onCollisionEnd(other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Player other) {
    if (other.interactionState == InteractionState.interacting) {
      parent.interactableBehaviorState.objectInteraction();
    }
    super.onCollision(intersectionPoints, other);
  }
}

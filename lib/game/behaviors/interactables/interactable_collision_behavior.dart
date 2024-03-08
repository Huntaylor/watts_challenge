// import 'package:environment_hackaton/game/behaviors/player/player.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/entity/interactable_objects.dart';
import 'package:environment_hackaton/game/entity/player_entity.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_bloc/flame_bloc.dart';

class InteractableCollisionBehavior
    extends CollisionBehavior<Player, InteractableObjects>
    with
        HasGameRef<WattsChallenge>,
        FlameBlocReader<PlayerGameCubit, PlayerGameState> {
  InteractableCollisionBehavior();

  @override
  void onCollisionEnd(Player other) {
    bloc.getWithinRange(isWithinRange: false);
    parent.isPlayerColliding = false;
    super.onCollisionEnd(other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Player other) {
    if (!gameRef.playerGameState.asInitial.isWithinRange) {
      bloc.getWithinRange(isWithinRange: true);
    }
    parent.isPlayerColliding = true;
    super.onCollision(intersectionPoints, other);
  }
}

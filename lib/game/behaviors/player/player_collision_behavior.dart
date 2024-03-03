import 'package:environment_hackaton/game/components/utils.dart';
import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class PlayerCollisionBehavior extends Behavior<Player>
    with CollisionCallbacks, HasGameRef<WattsChallenge> {
  PlayerCollisionBehavior();

  @override
  void update(double dt) {
    super.update(dt);
    _checkHorizontalCollisions();
    _checkVerticalCollisions();
  }

  void _checkHorizontalCollisions() {
    for (final block in game.level.collisionBlock) {
      if (checkCollisions(
        player: parent,
        block: block,
      )) {
        if (parent.direction.x > 0) {
          parent.position.x = block.x - parent.hitbox.x - parent.hitbox.width;
        }
        if (parent.direction.x < 0) {
          parent.position.x = block.x + block.width + parent.hitbox.x;
        }
      }
    }
  }

  void _checkVerticalCollisions() {
    for (final block in game.level.collisionBlock) {
      if (checkCollisions(
        player: parent,
        block: block,
      )) {
        if (parent.direction.y > 0) {
          parent.position.y = block.y - parent.hitbox.y - parent.hitbox.height;
        }
        if (parent.direction.y < 0) {
          parent.position.y = block.y + block.height + parent.hitbox.y;
        }
      }
    }
  }
}

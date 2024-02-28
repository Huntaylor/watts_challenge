import 'package:environment_hackaton/game/components/collision_block.dart';
import 'package:environment_hackaton/game/entity/player.dart';

bool checkCollisions({required Player player, required CollisionBlock block}) {
  final hitbox = player.hitbox;

  final playerX = player.position.x + hitbox.x;
  final playerY = player.position.y + hitbox.y;
  final playerWidth = hitbox.width;
  final playerHeight = hitbox.height;

  final blockX = block.x;
  final blockY = block.y;
  final blockWidth = block.width;
  final blockHeight = block.height;

  final fixedX = player.scale.x < 0 ? playerX - playerWidth : playerX;

  return playerY < blockY + blockHeight &&
      playerY + playerHeight > blockY &&
      fixedX < blockX + blockWidth &&
      fixedX + playerWidth > blockX;
}

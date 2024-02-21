import 'dart:async';

import 'package:environment_hackaton/game/components/collision_block.dart';
import 'package:environment_hackaton/game/components/player.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World with HasGameRef<WattsChallenge> {
  Level({
    required this.levelName,
    required this.player,
    super.children,
    super.priority,
  });
  final String levelName;
  final Player player;
  List<CollisionBlock> collisionBlock = [];

  @override
  Future<void> onLoad() async {
    debugMode = true;
    final level = await TiledComponent.load(
      levelName,
      Vector2.all(16),
    );

    add(level);

    _addCollisions(level);
    _spawningObjects(level);
    return super.onLoad();
  }

  void _addCollisions(TiledComponent level) {
    final collisionsLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        switch (collision.class_) {
          default:
            final block = CollisionBlock(
              position: Vector2(
                collision.x,
                collision.y,
              ),
              size: Vector2(
                collision.width,
                collision.height,
              ),
            );
            collisionBlock.add(block);
            add(block);
        }
      }
    }
  }

  void _spawningObjects(TiledComponent level) {
    final spawnPointLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if (spawnPointLayer != null) {
      for (final spawnPoint in spawnPointLayer.objects) {
        switch (spawnPoint.class_) {
          case 'Player':
            player.position = Vector2(
              spawnPoint.x,
              spawnPoint.y,
            );
            player.scale.x = 1;
            add(player);
          default:
        }
      }
    }
  }
}

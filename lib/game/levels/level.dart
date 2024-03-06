import 'dart:async';

import 'package:environment_hackaton/game/components/components.dart';
import 'package:environment_hackaton/game/components/shader_component.dart';
import 'package:environment_hackaton/game/entity/entity.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World with HasGameRef<WattsChallenge> {
  Level({
    required this.levelName,
    required this.foregroundLevelName,
    required this.player,
    super.children,
    super.priority,
  });
  final String levelName;
  final String foregroundLevelName;
  final Player player;
  List<CollisionBlock> collisionBlock = [];

  @override
  Future<void> onLoad() async {
    final level = await TiledComponent.load(
      levelName,
      Vector2.all(64),
      priority: game.levelPriority,
    );
    final foregroundLevel = await TiledComponent.load(
      foregroundLevelName,
      Vector2.all(64),
      priority: game.foregroundLevelPriority,
    );

    await addAll([
      level,
      foregroundLevel,
    ]);

    _addCollisions(level);
    _spawningObjects(level);
    _addShaders(level);
    return super.onLoad();
  }

  void _addCollisions(TiledComponent level) {
    final collisionsLayer = level.tileMap.getLayer<ObjectGroup>(
      AssetConst.collisions,
    );

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
    final spawnPointLayer =
        level.tileMap.getLayer<ObjectGroup>(AssetConst.spawnpoints);

    if (spawnPointLayer != null) {
      for (final spawnPoint in spawnPointLayer.objects) {
        switch (spawnPoint.class_) {
          case AssetConst.player:
            player.position = Vector2(
              spawnPoint.x,
              spawnPoint.y,
            );
            player.scale.x = 1;
            add(player);
          case AssetConst.lightSwitch:
            final lightSwitch = InteractableObjects(
              interactionTime: spawnPoint.properties
                  .getValue(AssetConst.interactionTime) as int,
              onSprite: game.images.fromCache(AssetConst.lightSwitchOn),
              offSprite: game.images.fromCache(AssetConst.lightSwitchOff),
              position: spawnPoint.position,
              size: spawnPoint.size,
            );

            add(lightSwitch);
        }
      }
    }
  }

  void _addShaders(TiledComponent level) {
    final shadersLayer =
        level.tileMap.getLayer<ObjectGroup>(AssetConst.shaders);

    if (shadersLayer != null) {
      for (final lightShaders in shadersLayer.objects) {
        switch (lightShaders.class_) {
          case AssetConst.lightShaders:
            final lightShader = LightShaderEntity(
              position: lightShaders.position,
            );
            add(lightShader);
        }
      }
    }
  }
}

import 'dart:async';

import 'package:environment_hackaton/game/behaviors/behaviors.dart';
import 'package:environment_hackaton/game/components/base_object.dart';
import 'package:environment_hackaton/game/components/components.dart';
import 'package:environment_hackaton/game/entity/entity.dart';
import 'package:environment_hackaton/game/game.dart';
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
    await _spawningObjects(level);
    await _addShaders(level);
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

  Future<void> _spawningObjects(TiledComponent level) async {
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
              lightSwitchState: await getSwitchState(spawnPoint.name),
              objectType: ObjectType.lightSwitch,
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

  Future<LightSwitchState> getSwitchState(String name) async {
    switch (name) {
      case AssetConst.hallwayProperty:
        return LightSwitchState.hallway;
      case AssetConst.masterBedroomProperty:
        return LightSwitchState.masterBedroom;
      case AssetConst.masterBathroomProperty:
        return LightSwitchState.masterBathroom;
      case AssetConst.masterClosetProperty:
        return LightSwitchState.masterCloset;
      case AssetConst.bedroom1Property:
        return LightSwitchState.bedroom1;
      case AssetConst.bedroomCloset1Property:
        return LightSwitchState.bedroomCloset1;
      case AssetConst.bedroom2Property:
        return LightSwitchState.bedroom2;
      case AssetConst.bedroomCloset2Property:
        return LightSwitchState.bedroomCloset2;
      case AssetConst.laundryRoomProperty:
        return LightSwitchState.laundryRoom;
      case AssetConst.garageProperty:
        return LightSwitchState.garage;
      case AssetConst.kitchenProperty:
        return LightSwitchState.kitchen;
      case AssetConst.pantryProperty:
        return LightSwitchState.pantry;
      default:
        return LightSwitchState.none;
    }
  }

  Future<void> _addShaders(TiledComponent level) async {
    final shadersLayer =
        level.tileMap.getLayer<ObjectGroup>(AssetConst.shaders);

    var shaderIndex = 0;

    if (shadersLayer != null) {
      for (final lightShaders in shadersLayer.objects) {
        switch (lightShaders.class_) {
          case AssetConst.lightShaders:
            shaderIndex++;
            final lightShaderEntity = LightShaderEntity(
              location: lightShaders.properties.getValue('location') as String,
              key: ComponentKey.named('${lightShaders.name}$shaderIndex'),
              shader: gameRef.shader,
              priority: 30,
              size: lightShaders.size,
              position: Vector2(
                lightShaders.position.x,
                lightShaders.position.y,
              ),
            );
            gameRef.lightShaders.add(lightShaderEntity);
            add(lightShaderEntity);
        }
      }
    }
  }
}

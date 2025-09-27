import 'dart:async';

import 'package:environment_hackaton/game/behaviors/behaviors.dart';
import 'package:environment_hackaton/game/components/components.dart';
import 'package:environment_hackaton/game/entity/entity.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World with HasGameReference<WattsChallenge> {
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

  late TiledComponent tiledLevel;
  late int gameTimer;

  @override
  Future<void> onLoad() async {
    tiledLevel = await TiledComponent.load(
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
      tiledLevel,
      foregroundLevel,
    ]);

    _addCollisions(tiledLevel);
    await _spawningObjects(tiledLevel);
    await _addShaders(tiledLevel);

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
    var powerUsage = 0.0;
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
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                lightSwitchStateParam: await getSwitchState(spawnPoint.name),
                objectTypeParam: ObjectType.lightSwitch,
                onSpriteParam: game.images.fromCache(AssetConst.lightSwitchOn),
                offSpriteParam:
                    game.images.fromCache(AssetConst.lightSwitchOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.console:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.small,
                onSpriteParam: game.images.fromCache(AssetConst.consoleOn),
                offSpriteParam: game.images.fromCache(AssetConst.consoleOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.fridge:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.large,
                onSpriteParam: game.images.fromCache(AssetConst.fridgeOn),
                offSpriteParam: game.images.fromCache(AssetConst.fridgeOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.lamp:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.small,
                onSpriteParam: game.images.fromCache(AssetConst.lampOn),
                offSpriteParam: game.images.fromCache(AssetConst.lampOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.laptop:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.medium,
                onSpriteParam: game.images.fromCache(AssetConst.laptopOn),
                offSpriteParam: game.images.fromCache(AssetConst.laptopOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.oven:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.large,
                onSpriteParam: game.images.fromCache(AssetConst.ovenOn),
                offSpriteParam: game.images.fromCache(AssetConst.ovenOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.radio:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.medium,
                onSpriteParam: game.images.fromCache(AssetConst.radioOn),
                offSpriteParam: game.images.fromCache(AssetConst.radioOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.thermo:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.large,
                onSpriteParam: game.images.fromCache(AssetConst.thermoOn),
                offSpriteParam: game.images.fromCache(AssetConst.thermoOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.tv:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.large,
                onSpriteParam: game.images.fromCache(AssetConst.tvOn),
                offSpriteParam: game.images.fromCache(AssetConst.tvOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.washingMachine:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.large,
                onSpriteParam:
                    game.images.fromCache(AssetConst.washingMachineOn),
                offSpriteParam:
                    game.images.fromCache(AssetConst.washingMachineOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
          case AssetConst.dryer:
            final cachedObjectProvider = CachedInteractableObjectProvider(
              ObjectParams(
                objectTypeParam: ObjectType.large,
                onSpriteParam: game.images.fromCache(AssetConst.dryerOn),
                offSpriteParam: game.images.fromCache(AssetConst.dryerOff),
                positionParam: spawnPoint.position,
                sizeParam: spawnPoint.size,
              ),
            );
            add(cachedObjectProvider.cachedComponent);
            powerUsage +=
                cachedObjectProvider.cachedComponent.baseObject.powerUsage;
        }
      }
    }
    if (game.gameState.isStarting) {
      game.gameCubit.setTotalUsage(objectUsage: powerUsage);
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
              shader: game.shader,
              priority: game.shaderPriority,
              size: lightShaders.size,
              position: Vector2(
                lightShaders.position.x,
                lightShaders.position.y,
              ),
            );
            game.lightShaders.add(lightShaderEntity);
            add(lightShaderEntity);
        }
      }
    }
  }
}

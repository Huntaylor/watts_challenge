import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:environment_hackaton/game/components/hud_components/interaction_time_bar_component.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/entity/entity.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';

import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_bloc/flame_bloc.dart';

enum InteractableState {
  on,
  off,
}

enum LightSwitchState {
  hallway,
  masterBedroom,
  masterBathroom,
  masterCloset,
  bedroom1,
  bedroomCloset1,
  bedroom2,
  bedroomCloset2,
  laundryRoom,
  garage,
  kitchen,
  pantry,
  none,
}

class InteractableBehaviorState extends Behavior<InteractableObjects>
    with
        HasGameReference<WattsChallenge>,
        FlameBlocListenable<PlayerGameCubit, PlayerGameState> {
  late final Sprite onSprite;
  late final Sprite offSprite;

  late List<LightShaderEntity> shaders;

  bool hasStarted = false;
  bool isTriggered = false;

  @override
  bool listenWhen(PlayerGameState previousState, PlayerGameState newState) {
    if (newState.asInitial.timerState == TimerState.complete &&
        parent.isPlayerColliding) {
      if (!isTriggered) {
        game.effectPlayer.play(AssetSource(AssetConst.sfx));
        isTriggered = true;
        parent
          ..isOn = !parent.isOn
          ..adjustTotalUsage();
        _loadObjectState();
      }
    } else {
      isTriggered = false;
    }
    return super.listenWhen(previousState, newState);
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
      ..current = InteractableState.on;
  }

  void _loadObjectState() {
    parent.current = parent.isOn ? InteractableState.on : InteractableState.off;
    if (parent.lightSwitchState != null) {
      switch (parent.lightSwitchState) {
        case LightSwitchState.hallway:
          shaders = getShaders(AssetConst.hallwayProperty);
          interactWithShaders(shaders);
        case LightSwitchState.masterBedroom:
          shaders = getShaders(AssetConst.masterBedroomProperty);
          interactWithShaders(shaders);
        case LightSwitchState.masterBathroom:
          shaders = getShaders(AssetConst.masterBathroomProperty);
          interactWithShaders(shaders);
        case LightSwitchState.masterCloset:
          shaders = getShaders(AssetConst.masterClosetProperty);
          interactWithShaders(shaders);
        case LightSwitchState.bedroom1:
          shaders = getShaders(AssetConst.bedroom1Property);
          interactWithShaders(shaders);
        case LightSwitchState.bedroomCloset1:
          shaders = getShaders(AssetConst.bedroomCloset1Property);
          interactWithShaders(shaders);
        case LightSwitchState.bedroom2:
          shaders = getShaders(AssetConst.bedroom2Property);
          interactWithShaders(shaders);
        case LightSwitchState.bedroomCloset2:
          shaders = getShaders(AssetConst.bedroomCloset2Property);
          interactWithShaders(shaders);
        case LightSwitchState.laundryRoom:
          shaders = getShaders(AssetConst.laundryRoomProperty);
          interactWithShaders(shaders);
        case LightSwitchState.garage:
          shaders = getShaders(AssetConst.garageProperty);
          interactWithShaders(shaders);
        case LightSwitchState.kitchen:
          shaders = getShaders(AssetConst.kitchenProperty);
          interactWithShaders(shaders);
        case LightSwitchState.pantry:
          shaders = getShaders(AssetConst.pantryProperty);
          interactWithShaders(shaders);
        case LightSwitchState.none:
        case null:
          break;
      }
    }
  }

  List<LightShaderEntity> getShaders(String locationName) {
    return game.lightShaders
        .where(
          (shader) =>
              shader.location.toLowerCase() == locationName.toLowerCase(),
        )
        .toList();
  }

  // ignore: no_leading_underscores_for_local_identifiers
  void interactWithShaders(List<LightShaderEntity> _shaders) {
    for (final shade in _shaders) {
      shade.isLightOn.value = !shade.isLightOn.value;
    }
  }
}

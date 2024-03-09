import 'dart:async';

import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/set_times_mixin.dart';
import 'package:flame/components.dart';

enum ObjectType {
  large,
  medium,
  small,
  lightSwitch,
}

class BaseObject extends PositionComponent
    with SetObjectTypeMixin, HasGameRef<WattsChallenge> {
  BaseObject({required this.objectType});

  final ObjectType objectType;

  late double interactionTime;
  late double powerUsage;

  @override
  FutureOr<void> onLoad() {
    switch (objectType) {
      case ObjectType.large:
        interactionTime = SetObjectTypeMixin.largeItemTime;
        powerUsage = SetObjectTypeMixin.largePowerUsage;
      case ObjectType.medium:
        interactionTime = SetObjectTypeMixin.mediumItemTime;
        powerUsage = SetObjectTypeMixin.mediumPowerUsage;
      case ObjectType.small:
        interactionTime = SetObjectTypeMixin.smallItemTime;
        powerUsage = SetObjectTypeMixin.smallPowerUsage;
      case ObjectType.lightSwitch:
        interactionTime = SetObjectTypeMixin.lightSwitchTime;
        powerUsage = SetObjectTypeMixin.lightSwitchPowerUsage;
    }

    gameRef.totalUsage += powerUsage;
    return super.onLoad();
  }
}

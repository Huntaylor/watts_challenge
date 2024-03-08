import 'dart:async';

import 'package:environment_hackaton/game/behaviors/player/player_state_behavior.dart';
import 'package:environment_hackaton/game/entity/hud_buttons/custom_hud_button.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';

enum InteractablePosition {
  holding,
  released,
}

class InteractionHudButton extends CustomHudButton {
  InteractionHudButton({
    required super.player,
    required super.buttonAsset,
    required super.buttonDownAsset,
  }) : super(
          buttonType: HudButtonType.interact,
          position: Vector2(1000, 600),
        );

  late InteractablePosition interactablePosition;

  late OpacityEffect disabledEffect;
  late OpacityEffect enabledEffect;

  late bool isDisabled;

  @override
  Future<void> onLoad() {
    _loadEffects();

    isDisabled = !player.isWithinRange;
    button!.add(disabledEffect);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    isDisabled = !player.isWithinRange;

    if (isDisabled) {
      disabledEffect.reset();
      button!.add(disabledEffect);
    }
    if (!isDisabled) {
      enabledEffect.reset();
      button!.add(enabledEffect);
    }

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (isDisabled) {
      return;
    } else {
      player.controllerBehavior.getInteraction(
        intState: InteractionState.interacting,
      );
    }
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (isDisabled) {
      return;
    } else {
      player.controllerBehavior.getInteraction(
        intState: InteractionState.notInteracting,
      );
    }
    super.onTapUp(event);
  }

  void _loadEffects() {
    disabledEffect = OpacityEffect.to(
      0.3,
      EffectController(duration: 0.07),
    );
    enabledEffect = OpacityEffect.fadeIn(
      EffectController(duration: 0.07),
    );
  }

  @override
  void Function()? get onReleased {
    player.controllerBehavior.getInteraction(
      intState: InteractionState.notInteracting,
    );
    return super.onReleased;
  }
}

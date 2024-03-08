import 'dart:async';

import 'package:environment_hackaton/game/components/interaction_time_bar_component.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/entity/hud_buttons/custom_hud_button.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';

enum InteractablePosition {
  holding,
  released,
}

class InteractionHudButton extends CustomHudButton
    with FlameBlocListenable<PlayerGameCubit, PlayerGameState> {
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

  late bool isReleasedTriggered;

  @override
  bool listenWhen(PlayerGameState previousState, PlayerGameState newState) {
    isDisabled = !newState.asInitial.isWithinRange;

    if (newState.asInitial.timerState == TimerState.complete) {
      if (onReleased != null) {
        onReleased?.call();
      }
    }
    return super.listenWhen(previousState, newState);
  }

  @override
  Future<void> onLoad() {
    isReleasedTriggered = true;
    isDisabled = true;
    _loadEffects();

    button!.add(disabledEffect);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (isDisabled) {
      if (onReleased != null) {
        onReleased?.call();
      }
      if (!button!.contains(disabledEffect)) {
        button!.add(disabledEffect);
      } else {
        disabledEffect.reset();
      }
    } else {
      isReleasedTriggered = false;
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
      _startInteraction();
    }
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (isDisabled) {
      return;
    } else {
      _stopInteraction();
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
    if (!isReleasedTriggered) {
      _stopInteraction();
    }
    return super.onReleased;
  }

  void _stopInteraction() {
    isReleasedTriggered = true;
    if (bloc.state.asInitial.isInteracting) {
      bloc.getInteractionCubit(isInteracting: false);
    }
  }

  void _startInteraction() {
    if (!bloc.state.asInitial.isInteracting) {
      bloc.getInteractionCubit(isInteracting: true);
    }
  }
}

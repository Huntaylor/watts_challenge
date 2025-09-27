import 'dart:async';

import 'package:environment_hackaton/game/components/hud_components/interaction_time_bar_component.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

class InteractionLoadingManager extends PositionComponent
    with
        HasGameReference<WattsChallenge>,
        FlameBlocListenable<PlayerGameCubit, PlayerGameState> {
  InteractionLoadingManager({
    required this.timerBar,
    super.position,
    super.scale,
    super.angle,
    super.children,
    super.priority,
  });

  final InteractionTimerBar timerBar;

  late TimerState timerState;
  late double interactionTime;
  late bool shouldAddBar;

  @override
  bool listenWhen(PlayerGameState previousState, PlayerGameState newState) {
    final playerState = newState.asInitial;
    timerState = playerState.timerState;
    interactionTime = newState.asInitial.objectInteractionTime;

    if (playerState.isInteracting && playerState.isWithinRange) {
      bloc.setTimer(timerState: TimerState.inProgress);
      shouldAddBar = true;
    } else if (timerState == TimerState.complete ||
        timerState == TimerState.cancelled) {
      bloc.setTimer(timerState: TimerState.initial);
      shouldAddBar = false;
    } else if (timerState == TimerState.inProgress &&
        !newState.asInitial.isInteracting) {
      bloc.setTimer(timerState: TimerState.cancelled);
      timerBar.cancelTimer();
      shouldAddBar = false;
    }
    return super.listenWhen(previousState, newState);
  }

  @override
  FutureOr<void> onLoad() {
    timerState = TimerState.initial;
    shouldAddBar = false;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (shouldAddBar && !contains(timerBar)) {
      add(
        timerBar..interactionTime = interactionTime,
      );
    } else if (!shouldAddBar && contains(timerBar)) {
      remove(timerBar);
    }
    super.update(dt);
  }
}

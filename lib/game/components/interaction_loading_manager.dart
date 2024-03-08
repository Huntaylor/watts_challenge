import 'dart:async';

import 'package:environment_hackaton/game/components/components.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

class InteractionLoadingManager extends PositionComponent
    with
        HasGameRef<WattsChallenge>,
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

  late bool shouldAddBar;

  @override
  bool listenWhen(PlayerGameState previousState, PlayerGameState newState) {
    final playerState = newState.asInitial;
    timerState = playerState.timerState;

    if (playerState.isInteracting && playerState.isWithinRange) {
      bloc.setTimer(timerState: TimerState.inProgress);
      shouldAddBar = true;
      // add(timerBar);
      // print('add!');
    } else if (timerState == TimerState.complete ||
        timerState == TimerState.cancelled) {
      bloc.setTimer(timerState: TimerState.initial);
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
      add(timerBar);
    } else if (!shouldAddBar && contains(timerBar)) {
      remove(timerBar);
    }
    super.update(dt);
  }
}

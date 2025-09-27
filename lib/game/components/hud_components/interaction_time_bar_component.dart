import 'dart:async';

import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';

enum TimerState {
  initial,
  inProgress,
  complete,
  cancelled,
}

class InteractionTimerBar extends PositionComponent
    with
        HasGameReference<WattsChallenge>,
        FlameBlocListenable<PlayerGameCubit, PlayerGameState> {
  InteractionTimerBar({
    super.position,
    super.scale,
    super.angle,
    super.children,
    super.priority,
  }) : super(
          size: Vector2(66, 20),
        );

  double _progress = 0;
  double accumulatedTime = 0;
  double fixedDeltaTime = 1 / 60;

  late TimerState timerState;
  late double interactionTime;

  double elapsedTime = 0;

  @override
  FutureOr<void> onLoad() {
    timerState = TimerState.initial;
    _progress = 0.0;
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = Colors.grey,
    );

    final progressWidth = size.x * _progress;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, progressWidth, size.y),
      Paint()..color = Colors.yellow,
    );
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (timerState == TimerState.initial ||
        timerState == TimerState.inProgress) {
      elapsedTime += dt;
      final targetProgress = elapsedTime / interactionTime;

      if (targetProgress <= 1.0) {
        _progress = targetProgress;
      } else {
        _progress = 1.0;
        timerState = TimerState.complete;
        bloc.setTimer(timerState: timerState);
        _resetTimer();
      }
    } else {
      _resetTimer();
    }
  }

  void _resetTimer() {
    elapsedTime = 0;
    _progress = 0;
    timerState = TimerState.initial;
  }

  void cancelTimer() {
    elapsedTime = 0;
    _progress = 0;
    timerState = TimerState.cancelled;
  }
}

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
        HasGameRef<WattsChallenge>,
        FlameBlocListenable<PlayerGameCubit, PlayerGameState> {
  InteractionTimerBar({
    required this.interactionTime,
    super.position,
    super.scale,
    super.angle,
    super.children,
    super.priority,
  }) : super(
          size: Vector2(66, 20),
        );

  int interactionTime;
  double _progress = 0;
  double accumulatedTime = 0;
  double fixedDeltaTime = 1 / 60;

  late TimerState timerState;
  late TimerComponent _timerComponent;

  double elapsedTime = 0;

  @override
  FutureOr<void> onLoad() {
    timerState = TimerState.initial;
    _progress = 0.0;
    final interactionDuration = interactionTime.toDouble();
    _timerComponent = TimerComponent(
      period: interactionTime.toDouble(),
      onTick: () {
        if (_progress >= interactionDuration) {
          _progress = interactionDuration;
          _timerComponent.timer.stop();
        }
      },
    );
    add(_timerComponent);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = Colors.grey,
    );

    final progressRatio = _progress / interactionTime.toDouble();

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x * progressRatio,
        size.y,
      ),
      Paint()..color = Colors.yellow,
    );
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    accumulatedTime += dt;
    while (accumulatedTime >= fixedDeltaTime) {
      if (gameRef.playerGameState.asInitial.isInteracting) {
        if (_progress < interactionTime.toDouble()) {
          _progress += fixedDeltaTime *
              (interactionTime / 2); // Update progress based on time
          if (_progress >= interactionTime.toDouble()) {
            _progress = interactionTime.toDouble();
            _timerComponent.timer.stop();
            timerState = TimerState.complete;
            bloc.setTimer(timerState: timerState);
            _resetTimer();
          }
        }
      }
      accumulatedTime -= fixedDeltaTime;
    }
  }

  void startTimer() {
    _progress = 0.0;
    _timerComponent.timer.start();
  }

  void cancelInteraction() {
    _progress = 0.0;
    timerState = TimerState.cancelled;
    bloc.setTimer(timerState: timerState);
    _timerComponent.timer.stop();
    _timerComponent.timer.reset();
  }

  void _resetTimer() {
    _progress = 0.0;
    _timerComponent.timer.stop();
    _timerComponent.timer.reset();
  }
}

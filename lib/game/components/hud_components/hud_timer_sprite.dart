import 'dart:async';
import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart' as color;

class HudTimerSprite extends SpriteComponent
    with HasGameRef<WattsChallenge>, FlameBlocListenable<GameCubit, GameState> {
  HudTimerSprite({
    super.size,
    super.position,
    super.anchor,
    super.sprite,
  });
  late TextComponent textComponent;
  late TimerComponent gameTime;
  late double drawSize;

  String timer = '';
  int minutes = 0;
  int moveMark = 10;
  double leftOffset = 9.5;
  double topOffset = .5;
  Vector2 overTenMins = Vector2(9, 7);
  Vector2 underTenMins = Vector2(38, 7);

  @override
  bool listenWhen(GameState previousState, GameState newState) {
    if (newState.isStarting && newState.asStarting.percentage <= 100) {
      bloc.gameOver(timer);
      gameRef.pauseEngine();
    }
    if (newState.isGameOver) {
      gameRef.overlays.add(AssetConst.completeOverlay);
    }
    return super.listenWhen(previousState, newState);
  }

  @override
  FutureOr<void> onLoad() {
    drawSize = size.x - 18.5;
    textComponent = TextComponent();

    gameTime = TimerComponent(
      period: 60,
      repeat: true,
      autoStart: false,
      onTick: () {
        minutes++;
      },
    );
    if (gameRef.gameState.isStarting) {
      gameTime.timer.start();
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    gameTime.update(dt);
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    String seconds;
    Vector2 position;
    final current = gameTime.timer.current;
    if (current < moveMark) {
      seconds = '0${current.toStringAsFixed(2)}';
    } else {
      seconds = current.toStringAsFixed(2);
    }
    if (minutes >= moveMark) {
      position = overTenMins;
    } else {
      position = underTenMins;
    }

    timer = '$minutes:$seconds';
    textComponent.textRenderer =
        TextPaint(style: WattsChallengeTextStyle.headline2);
    canvas
      ..drawRect(
        Rect.fromLTWH(leftOffset, topOffset, drawSize, size.y - 1),
        Paint()..color = color.Colors.yellow.withAlpha(200),
      )
      ..restore();
    textComponent.textRenderer.render(
      canvas,
      timer,
      position,
    );
    super.render(canvas);
  }
}

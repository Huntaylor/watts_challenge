import 'dart:async';
import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart' as color;

class HudSpriteTimer extends SpriteComponent with HasGameRef<WattsChallenge> {
  HudSpriteTimer({
    super.size,
    super.position,
    super.anchor,
    super.sprite,
  });
  late TextComponent textComponent;
  late TimerComponent gameTime;
  late double drawSize;

  int minutes = 0;
  int moveMark = 10;
  double leftOffset = 9.5;
  double topOffset = .5;
  Vector2 overTenMins = Vector2(9, 7);
  Vector2 underTenMins = Vector2(38, 7);

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
      '$minutes:$seconds',
      position,
    );
    super.render(canvas);
  }
}

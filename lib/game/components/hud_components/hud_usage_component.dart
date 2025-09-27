import 'dart:async';
import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart' as color;

class HudUsageComponent extends SpriteComponent
    with
        HasGameReference<WattsChallenge>,
        FlameBlocListenable<GameCubit, GameState> {
  HudUsageComponent({
    super.size,
    super.position,
    super.anchor,
    super.sprite,
  });
  late TextComponent textComponent;
  late double drawSize;

  double leftOffset = 9.5;
  double topOffset = .5;
  Vector2 newPosition = Vector2(16, 23);
  String percentageName = '';
  double percentageAmount = 0;
  double maxPercentage = 0;
  double halfWayPercentage = 0;

  @override
  bool listenWhen(GameState previousState, GameState newState) {
    if (newState.isStarting) {
      percentageAmount = newState.asStarting.percentage;
      percentageName = '${newState.asStarting.percentage.toStringAsFixed(2)}%';
    }
    return super.listenWhen(previousState, newState);
  }

  @override
  FutureOr<void> onLoad() {
    drawSize = size.x - 34;
    textComponent = TextComponent();

    if (game.gameState.isStarting) {
      percentageName =
          '${game.gameState.asStarting.percentage.toStringAsFixed(2)}%';
      percentageAmount = game.gameState.asStarting.percentage;
      maxPercentage = game.gameState.asStarting.percentage;
    }

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    canvas.save();

    textComponent.textRenderer =
        TextPaint(style: WattsChallengeTextStyle.headline2);
    canvas
      ..drawRect(
        Rect.fromLTWH(leftOffset, topOffset, drawSize, size.y - 1),
        Paint()..color = getUsageColor(percentageAmount),
      )
      ..restore();
    textComponent.textRenderer.render(
      canvas,
      percentageName,
      newPosition,
    );
    super.render(canvas);
  }

  Color getUsageColor(double usagePercentage) {
    if (usagePercentage <= maxPercentage && usagePercentage > 100) {
      return color.Colors.red[900]!.withAlpha(200);
    } else if (usagePercentage <= 100) {
      return color.Colors.green[900]!.withAlpha(200);
    } else {
      return color.Colors.blue.withAlpha(200);
    }
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart' as color;

class HudUsageComponent extends SpriteComponent
    with HasGameRef<WattsChallenge>, FlameBlocListenable<GameCubit, GameState> {
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
  Vector2 newPosition = Vector2(22, 23);

  @override
  FutureOr<void> onLoad() {
    drawSize = size.x - 34;
    textComponent = TextComponent();

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
        Paint()..color = color.Colors.red[900]!.withAlpha(200),
      )
      ..restore();
    textComponent.textRenderer.render(
      canvas,
      '200%',
      newPosition,
    );
    super.render(canvas);
  }
}

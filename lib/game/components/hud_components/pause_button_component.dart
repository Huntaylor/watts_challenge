import 'dart:ui';

import 'package:environment_hackaton/game/entity/hud_buttons/hud_buttons.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';

class PauseButtonComponent extends ButtonComponent
    with HasGameRef<WattsChallenge> {
  PauseButtonComponent({
    required this.buttonAsset,
    super.size,
    super.position,
    super.anchor,
  }) : super(
          button: CustomButtonSprite(
            sprite: Sprite(buttonAsset),
            size: size,
          ),
        );

  final Image buttonAsset;

  @override
  void onTapDown(TapDownEvent event) {
    gameRef.pauseEngine();
    gameRef.overlays.add(AssetConst.pauseMenu);
    super.onTapDown(event);
  }
}

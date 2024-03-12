import 'dart:ui';

import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';

class PauseOverlay extends PositionComponent with HasGameRef<WattsChallenge> {
  PauseOverlay({
    super.anchor,
    super.position,
    super.size,
  });

  @override
  void render(Canvas canvas) {
    canvas.drawImage(
        game.images.fromCache(AssetConst.menu), const Offset(50, 50), Paint());
    super.render(canvas);
  }
}

import 'package:environment_hackaton/game/components/player.dart';
import 'package:environment_hackaton/game/levels/level.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
// import 'package:flutter/painting.dart';

class WattsChallenge extends FlameGame with HasKeyboardHandlerComponents {
  WattsChallenge(
      // required this.l10n,
      // required this.effectPlayer,
      // required this.textStyle,
      );

  // final AppLocalizations l10n;

  // final AudioPlayer effectPlayer;

  // final TextStyle textStyle;

  Player player = Player();
  late Level level;

  // @override
  // Color backgroundColor() => const Color.fromARGB(255, 1, 0, 52);

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    await _loadLevel();
  }

  Future<void> _loadLevel() async {
    level = Level(
      levelName: 'house_1.tmx',
      player: player,
    )..priority = 10;

    final finder = Viewfinder()..anchor = Anchor.center;

    camera = CameraComponent.withFixedResolution(
      viewfinder: finder,
      world: level,
      width: 320,
      height: 180,
      // width: 640,
      // height: 360,
    );

    camera.follow(
      snap: true,
      player,
    );
    await addAll(
      [camera, level],
    );
  }
}

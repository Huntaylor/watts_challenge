import 'package:environment_hackaton/game/components/player.dart';
import 'package:environment_hackaton/game/levels/level.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class WattsChallenge extends FlameGame {
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

  @override
  Color backgroundColor() => const Color.fromARGB(255, 1, 0, 52);

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    _loadLevel();
  }

  void _loadLevel() {
    level = Level(
      levelName: 'house_1.tmx',
      player: player,
    )..debugMode = true;

    print(player.x);

    final finder = Viewfinder();
    // final playerOffset = Offset(player.x + .1, player.y);

    finder.anchor = Anchor.topLeft;

    camera = CameraComponent.withFixedResolution(
      viewfinder: finder,
      world: level,
      width: 640,
      height: 360,
    );

    // camera.backdrop = BackgroundTile(
    //   position: Vector2.zero(),
    // );
    // finder.zoom = .06;

    camera.follow(
      horizontalOnly: true,
      player,
    );
    addAll(
      [camera, level],
    );
  }
}

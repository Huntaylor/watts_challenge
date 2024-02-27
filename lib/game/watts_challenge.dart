import 'dart:ui';

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

  late Map<String, dynamic> walkingForwardData;
  late Map<String, dynamic> walkingReallyData;
  late Map<String, dynamic> walkingBackData;
  late Map<String, dynamic> walkingLeftData;
  late Map<String, dynamic> walkingRightData;
  late Map<String, dynamic> idleForwardData;
  late Map<String, dynamic> idleReallyData;
  late Map<String, dynamic> idleBackData;
  late Map<String, dynamic> idleRightData;
  late Map<String, dynamic> idleLeftData;

  late FragmentProgram fragmentProgram;

  //Priorities
  final int levelPriority = 1;
  final int playerPriority = 2;
  final int foregroundLevelPriority = 3;

  // @override
  // Color backgroundColor() => const Color.fromARGB(255, 1, 0, 52);

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    fragmentProgram =
        await FragmentProgram.fromAsset('assets/shaders/lightbulbs.glsl');

    await _loadLevel();
  }

  Future<void> _loadLevel() async {
    level = Level(
      // levelName: 'house_scaled_up.tmx',
      levelName: 'house_1.tmx',
      foregroundLevelName: 'house_1_foreground.tmx',
      player: player..priority = playerPriority,
    );

    final finder = Viewfinder()..anchor = Anchor.center;

    camera = CameraComponent.withFixedResolution(
      viewfinder: finder,
      world: level,
      width: 1280,
      height: 720,
      // width: 640,
      // height: 360,

      hudComponents: [],
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

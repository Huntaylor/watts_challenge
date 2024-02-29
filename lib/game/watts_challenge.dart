import 'dart:ui';

import 'package:environment_hackaton/game/entity/hud_entity.dart';
import 'package:environment_hackaton/game/entity/player.dart';
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

  late List<DpadEntity> hudComponents;

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

    hudComponents = [
      DpadEntity(
        player: level.player,
        buttonAsset: images.fromCache('hud/dpad_middle.png'),
        buttonDownAsset: images.fromCache('hud/dpad_middle.png'),
        dpadState: DpadPositionState.middle,
      ),
      DpadEntity(
        player: level.player,
        buttonAsset: images.fromCache('hud/dpad_up.png'),
        buttonDownAsset: images.fromCache('hud/dpad_up_pressed.png'),
        dpadState: DpadPositionState.up,
      ),
      DpadEntity(
        player: level.player,
        buttonAsset: images.fromCache('hud/dpad_down.png'),
        buttonDownAsset: images.fromCache('hud/dpad_down_pressed.png'),
        dpadState: DpadPositionState.down,
      ),
      DpadEntity(
        player: level.player,
        buttonAsset: images.fromCache('hud/dpad_right.png'),
        buttonDownAsset: images.fromCache('hud/dpad_right_pressed.png'),
        dpadState: DpadPositionState.right,
      )..size = Vector2(82, 80),
      DpadEntity(
        player: level.player,
        buttonAsset: images.fromCache('hud/dpad_left.png'),
        buttonDownAsset: images.fromCache('hud/dpad_left_pressed.png'),
        dpadState: DpadPositionState.left,
      )..size = Vector2(82, 80),
    ];

    final finder = Viewfinder()..anchor = Anchor.center;

    camera = CameraComponent.withFixedResolution(
      viewfinder: finder,
      world: level,
      width: 1280,
      height: 720,
      hudComponents: hudComponents,
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

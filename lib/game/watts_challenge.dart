import 'dart:ui';

import 'package:environment_hackaton/game/entity/hud_sprint_button_entity.dart';
import 'package:environment_hackaton/game/entity/joystick_entity.dart';
import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/levels/level.dart';
import 'package:environment_hackaton/utils/shader.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
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

  late FragmentProgram fragmentProgram;

  late JoyStickEntity joyStickEntity;

  late CustomHudButtonEntity hudSprintButtonComponent;
  late CustomHudButtonEntity hudInteractButtonComponent;

  //Priorities
  final int levelPriority = 1;
  final int playerPriority = 2;
  final int foregroundLevelPriority = 3;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    fragmentProgram =
        await FragmentProgram.fromAsset('assets/shaders/lightbulbs.glsl');

    await _loadLevel();
  }

  Future<void> _loadLevel() async {
    level = Level(
      levelName: 'house_1.tmx',
      foregroundLevelName: 'house_1_foreground.tmx',
      player: player..priority = playerPriority,
    );

    //Shader?
    final fragment =
        await FragmentProgram.fromAsset('asset/shaders/lightbulbs.glsl');

    final shader = Shader(Colors.amber, shader: fragment.fragmentShader());

    joyStickEntity = JoyStickEntity(
      player: player,
      knobImage: images.fromCache('hud/knob.png'),
      backgroundImage: images.fromCache('hud/joystick.png'),
    );

    hudSprintButtonComponent = CustomHudButtonEntity(
      player: player,
      buttonAsset: images.fromCache('hud/sprint_button.png'),
      buttonDownAsset: images.fromCache('hud/sprint_button_down.png'),
      size: Vector2.all(162),
      position: Vector2(1120, 460),
      buttonType: HudButtonType.sprint,
    );
    hudInteractButtonComponent = CustomHudButtonEntity(
      player: player,
      buttonAsset: images.fromCache('hud/interact_button.png'),
      buttonDownAsset: images.fromCache('hud/interact_button_down.png'),
      size: Vector2(256, 64),
      position: Vector2(1120, 600),
      buttonType: HudButtonType.interact,
    );

    final finder = Viewfinder()..anchor = Anchor.center;

    camera = CameraComponent.withFixedResolution(
      viewfinder: finder,
      world: level,
      width: 1280,
      height: 720,
      hudComponents: [
        joyStickEntity,
        hudSprintButtonComponent,
        hudInteractButtonComponent,
      ],
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

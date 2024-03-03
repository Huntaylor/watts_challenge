import 'package:environment_hackaton/game/components/hud_text_component.dart';
import 'package:environment_hackaton/game/entity/hud_sprint_button_entity.dart';
import 'package:environment_hackaton/game/entity/joystick_entity.dart';
import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/levels/level.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
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

  late JoyStickEntity joyStickEntity;

  late CustomHudButtonEntity hudSprintButtonComponent;
  late CustomHudButtonEntity hudInteractButtonComponent;

  late HudText hudTimer;

  //Priorities
  final int levelPriority = 1;
  final int playerPriority = 2;
  final int foregroundLevelPriority = 3;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    await _loadHud();

    await _loadLevel();
  }

  Future<void> _loadLevel() async {
    level = Level(
      levelName: AssetConst.house1,
      foregroundLevelName: AssetConst.houseForeground,
      player: player..priority = playerPriority,
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
        // hudTimer,
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

  Future<void> _loadHud() async {
    joyStickEntity = JoyStickEntity(
      player: player,
      knobImage: images.fromCache(AssetConst.knob),
      backgroundImage: images.fromCache(AssetConst.joystick),
    );

    hudSprintButtonComponent = CustomHudButtonEntity(
      player: player,
      buttonAsset: images.fromCache(AssetConst.sprintButton),
      buttonDownAsset: images.fromCache(AssetConst.sprintButtonDown),
      size: Vector2.all(162),
      position: Vector2(1120, 460),
      buttonType: HudButtonType.sprint,
    );
    hudInteractButtonComponent = CustomHudButtonEntity(
      player: player,
      buttonAsset: images.fromCache(AssetConst.interactButton),
      buttonDownAsset: images.fromCache(AssetConst.interactButtonDown),
      size: Vector2(256, 64),
      position: Vector2(1120, 600),
      buttonType: HudButtonType.interact,
    );

    // hudTimer = HudText(
    //   size: Vector2.all(32),
    //   position: Vector2(10, 100),
    // );
  }
}

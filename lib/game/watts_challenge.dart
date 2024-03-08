import 'dart:ui';

import 'package:environment_hackaton/game/components/hud_text_component.dart';
import 'package:environment_hackaton/game/components/interaction_loading_manager.dart';
import 'package:environment_hackaton/game/components/interaction_time_bar_component.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/entity/entity.dart';
import 'package:environment_hackaton/game/levels/level.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_bloc/flame_bloc.dart';

class WattsChallenge extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  WattsChallenge({
    required this.gameCubit,
    required this.playerCubit,
  }
      // required this.l10n,
      // required this.effectPlayer,
      // required this.textStyle,
      );

  final GameCubit gameCubit;
  final PlayerGameCubit playerCubit;
  // final AppLocalizations l10n;

  // final AudioPlayer effectPlayer;

  // final TextStyle textStyle;

  late FragmentShader shader;

  Player player = Player();
  late Level level;

  late JoyStickEntity joyStickEntity;

  late InteractionLoadingManager loadingManager;

  late CustomHudButton hudSprintButtonComponent;
  late CustomHudButton hudInteractButtonComponent;

  List<LightShaderEntity> lightShaders = [];

  late HudText hudTimer;

  GameState get gameState => gameCubit.state;

  PlayerGameState get playerGameState => playerCubit.state;

  //Priorities
  final int levelPriority = 1;
  final int interactablePriority = 2;
  final int playerPriority = 3;
  final int foregroundLevelPriority = 4;
  final int interactionBarPriority = 5;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    final program = await FragmentProgram.fromAsset(
      AssetConst.darkeningShader,
    );

    shader = program.fragmentShader();

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
        loadingManager,
        hudTimer,
      ],
    );

    camera.follow(
      snap: true,
      player,
    );
    // await addAll(
    //   [camera, level],
    // );
    await add(
      FlameBlocProvider<PlayerGameCubit, PlayerGameState>.value(
        value: playerCubit,
        children: [
          camera,
          level,
        ],
      ),
    );
  }

  Future<void> _loadHud() async {
    joyStickEntity = JoyStickEntity(
      player: player,
      knobImage: images.fromCache(AssetConst.knob),
      backgroundImage: images.fromCache(AssetConst.joystick),
    );

    hudSprintButtonComponent = SprintHudButton(
      player: player,
      buttonAsset: images.fromCache(AssetConst.sprintButton),
      buttonDownAsset: images.fromCache(AssetConst.sprintButtonDown),
    );
    hudInteractButtonComponent = InteractionHudButton(
      player: player,
      buttonAsset: images.fromCache(AssetConst.interactButton),
      buttonDownAsset: images.fromCache(AssetConst.interactButtonDown),
    );

    final timeBarPosition = Vector2(640, 325);

    loadingManager = InteractionLoadingManager(
      timerBar: InteractionTimerBar(interactionTime: 5),
      position: timeBarPosition,
    );

    hudTimer = HudText(
      size: Vector2.all(32),
      position: Vector2(10, 100),
    );
  }
}

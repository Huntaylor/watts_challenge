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

  Player player = Player();

  late Level level;

  late FragmentShader shader;
  late JoyStickEntity joyStickEntity;
  late InteractionLoadingManager loadingManager;
  late CustomHudButton hudSprintButtonComponent;
  late CustomHudButton hudInteractButtonComponent;
  late HudText hudTimer;

  List<LightShaderEntity> lightShaders = [];
  List<InteractableObjects> objects = [];

  GameState get gameState => gameCubit.state;

  PlayerGameState get playerGameState => playerCubit.state;

  //Priorities
  final int levelPriority = 1;
  final int interactablePriority = 2;
  final int playerPriority = 3;
  final int foregroundLevelPriority = 4;
  final int interactionBarPriority = 5;

  double totalUsage = 0;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    final program = await FragmentProgram.fromAsset(
      AssetConst.darkeningShader,
    );

    shader = program.fragmentShader();

    await _loadHud();

    await _loadLevel();

    await _initializeGameCubit();
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

    await add(
      FlameMultiBlocProvider(
        providers: [
          FlameBlocProvider<GameCubit, GameState>.value(
            value: gameCubit,
            children: [
              level,
            ],
          ),
          FlameBlocProvider<PlayerGameCubit, PlayerGameState>.value(
            value: playerCubit,
            children: [
              level,
              camera,
            ],
          ),
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
      timerBar: InteractionTimerBar(),
      position: timeBarPosition,
    );

    hudTimer = HudText(
      size: Vector2.all(32),
      position: Vector2(10, 100),
    );
  }

  Future<void> _initializeGameCubit() async {
    gameCubit.startGame(totalUsage: totalUsage, gameTimer: 60);
  }
}

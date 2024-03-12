import 'package:environment_hackaton/app/view/overlays/complete_overlay.dart';
import 'package:environment_hackaton/app/view/overlays/pause_overlay.dart';
import 'package:environment_hackaton/app/view/widgets/background.dart';
import 'package:environment_hackaton/game/cubit/audio/audio_cubit.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const MyGame(),
    );
  }

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  void resetGame() {
    context.read<GameCubit>().newGame();
    setState(
      MyGame.new,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GameView(
      callbackAction: resetGame,
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({required this.callbackAction, super.key});

  final void Function() callbackAction;

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PlayerGameCubit>();
    final gameCubit = context.read<GameCubit>();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GameWidget<WattsChallenge>.controlled(
            loadingBuilder: (context) => const LoadingBackground(),
            gameFactory: () => WattsChallenge(
              effectPlayer: context.read<AudioCubit>().effectPlayer,
              playerCubit: playerCubit,
              gameCubit: gameCubit,
            ),
            overlayBuilderMap: {
              AssetConst.pauseMenu: (context, game) => PauseOverlay(
                    reset: callbackAction,
                    game: game,
                  ),
              AssetConst.completeOverlay: (context, game) => CompleteOverlay(
                    reset: callbackAction,
                    game: game,
                  ),
            },
          ),
        ],
      ),
    );
  }
}

import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const MyGame(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const GameView();
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PlayerGameCubit>();
    final gameCubit = context.read<GameCubit>();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GameWidget<WattsChallenge>.controlled(
            gameFactory: () => WattsChallenge(
              playerCubit: playerCubit,
              gameCubit: gameCubit,
            ),
            overlayBuilderMap: const {},
          ),
        ],
      ),
    );
  }
}

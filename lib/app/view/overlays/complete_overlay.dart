import 'package:environment_hackaton/app/view/main_menu.dart';
import 'package:environment_hackaton/game/cubit/audio/audio_cubit.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flutter/material.dart';

class CompleteOverlay extends StatelessWidget {
  const CompleteOverlay({required this.reset, required this.game, super.key});

  final WattsChallenge game;
  final void Function() reset;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) {
        return current.isGameOver;
      },
      builder: (context, state) => Center(
        child: Container(
          color: Colors.amber[400],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Congrats, the house is now saving energy!'),
              Text('Time ${state.asGameOver.endTime}'),
              Text('Ending usage: ${state.asGameOver.percentage}'),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue[800],
                ),
                onPressed: () {
                  reset();
                  game.resetGame();
                  final audio = context.read<AudioCubit>().state.volume;
                  if (audio == 0) {
                    context.read<AudioCubit>().toggleVolume();
                  }
                  Navigator.of(context).push(
                    MainMenu.route(),
                  );
                },
                child: const Text('Main Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:environment_hackaton/app/view/main_menu.dart';
import 'package:environment_hackaton/game/cubit/audio/audio_cubit.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/game/view/game_view.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flutter/material.dart';

class PauseOverlay extends StatelessWidget {
  const PauseOverlay({required this.reset, required this.game, super.key});

  final WattsChallenge game;
  final void Function() reset;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) {
        return current.isStarting;
      },
      builder: (context, state) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.yellow[800],
                ),
                onPressed: () {
                  game.overlays.remove(AssetConst.pauseMenu);
                  game.resumeEngine();
                },
                child: const Text('Resume'),
              ),
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
              const SizedBox(
                height: 8,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red[800],
                ),
                label: const Text('Restart'),
                onPressed: () {
                  reset();
                  game.resetGame();
                  Navigator.of(context).push(
                    MyGame.route(),
                  );
                },
                icon: const Icon(
                  Icons.restart_alt,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<AudioCubit, AudioState>(
                builder: (context, state) {
                  return ElevatedButton.icon(
                    label: const Text('Sounds'),
                    onPressed: () {
                      context.read<AudioCubit>().toggleVolume();
                    },
                    icon: Icon(
                      state.volume == 0 ? Icons.volume_mute : Icons.volume_up,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

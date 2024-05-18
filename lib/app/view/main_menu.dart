import 'package:animated_button/animated_button.dart';
import 'package:environment_hackaton/app/view/info.dart';
import 'package:environment_hackaton/app/view/widgets/background.dart';
import 'package:environment_hackaton/game/cubit/audio/audio_cubit.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const MainMenu(),
    );
  }

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late final Bgm bgm;

  @override
  void initState() {
    super.initState();
    bgm = context.read<AudioCubit>().bgm;
    bgm.play(AssetConst.bgm);
  }

  @override
  void dispose() {
    bgm.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const GameBackground(),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedButton(
                        color: Colors.red[800]!,
                        onPressed: () {
                          Navigator.of(context).push(
                            Info.route(),
                          );
                        },
                        child: const Text('Play'),
                      ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // AnimatedButton(
                      //   onPressed: () {},
                      //   child: const Text('Score Board'),
                      // ),
                      const SizedBox(
                        height: 16,
                      ),
                      BlocBuilder<AudioCubit, AudioState>(
                        builder: (context, state) {
                          return AnimatedButton(
                            shape: BoxShape.circle,
                            onPressed: () {
                              context.read<AudioCubit>().toggleVolume();
                            },
                            child: Icon(
                              state.volume == 0
                                  ? Icons.volume_mute
                                  : Icons.volume_up,
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
            ],
          ),
        ),
      ),
    );
  }
}

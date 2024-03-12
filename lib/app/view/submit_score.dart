import 'package:animated_button/animated_button.dart';
import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/app/view/widgets/background.dart';
import 'package:environment_hackaton/app/view/widgets/initials_field.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/view/game_view.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';

class SubmitScore extends StatefulWidget {
  const SubmitScore({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const SubmitScore(),
    );
  }

  @override
  State<SubmitScore> createState() => _SubmitScoreState();
}

class _SubmitScoreState extends State<SubmitScore> {
  late final Bgm bgm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const InfoBackground(),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit Score',
                        style: WattsChallengeTextStyle.headline1,
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Text('Time: ${state.asGameOver.endTime}'),
                      Text(state.asGameOver.percentage),
                      const InitialsTextField(),
                      AnimatedButton(
                        color: Colors.red[800]!,
                        onPressed: () {
                          Navigator.of(context).push(
                            MyGame.route(),
                          );
                        },
                        child: const Text('Submit!'),
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

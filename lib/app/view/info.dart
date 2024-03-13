import 'package:animated_button/animated_button.dart';
import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/app/view/widgets/background.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/view/game_view.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const Info(),
    );
  }

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
                        'How to play',
                        style: WattsChallengeTextStyle.headline1,
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const Text('Your house has a lot of power usage.'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Turn off as many devices as you can! ->',
                          ),
                          Image.asset(AssetConst.lightSwitchAsset),
                        ],
                      ),
                      const Text('Hold the space to turn off devices'),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [

                      //     Image.asset(
                      //       AssetConst.interactButtonFile,
                      //       scale: 3,
                      //     ),
                      //   ],
                      // ),
                      const Text('Hold the shift key to run!'),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Image.asset(
                      //       AssetConst.sprintButtonFile,
                      //       scale: 3,
                      //     ),
                      //   ],
                      // ),
                      AnimatedButton(
                        color: Colors.red[800]!,
                        onPressed: () {
                          Navigator.of(context).push(
                            MyGame.route(),
                          );
                        },
                        child: const Text('Jump in!'),
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

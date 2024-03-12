import 'package:animated_button/animated_button.dart';
import 'package:environment_hackaton/app/view/widgets/background.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/view/game_view.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const MainMenu(),
    );
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
                            MyGame.route(),
                          );
                        },
                        child: const Text('Play'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AnimatedButton(
                        onPressed: () {},
                        child: const Text('Score Board'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedButton(
                            shape: BoxShape.circle,
                            onPressed: () {},
                            child: const Icon(
                              Icons.music_note,
                            ),
                          ),
                          AnimatedButton(
                            shape: BoxShape.circle,
                            onPressed: () {},
                            child: const Icon(
                              Icons.volume_mute,
                            ),
                          ),
                        ],
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

// class MenuButtons extends StatelessWidget {
//   const MenuButtons({
//     required this.onPlayPressed,
//     super.key,
//   });

//   final VoidCallback onPlayPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             AnimatedButton(
//               color: Colors.red[800]!,
//               onPressed: onPlayPressed,
//               child: const Text('Play'),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             AnimatedButton(
//               onPressed: () {},
//               child: const Text('Score Board'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AnimatedButton(
//                   shape: BoxShape.circle,
//                   onPressed: () {},
//                   child: const Icon(
//                     Icons.music_note,
//                   ),
//                 ),
//                 AnimatedButton(
//                   shape: BoxShape.circle,
//                   onPressed: () {},
//                   child: const Icon(
//                     Icons.volume_mute,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

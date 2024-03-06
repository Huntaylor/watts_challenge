import 'package:app_ui/app_ui.dart';

import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/game.dart';

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayerGameCubit>(
          create: (_) => PlayerGameCubit(),
        ),
        BlocProvider<GameCubit>(
          create: (_) => GameCubit(),
        ),
      ],
      child: MaterialApp.router(
        builder: (context, child) => const GameView(),
        theme: ThemeData(
          textTheme: WattsChallengeTheme.standard.textTheme,
        ),
        routerConfig: goRoutes,
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PlayerGameCubit>();
    final gameCubit = context.read<GameCubit>();

    return Scaffold(
      body: SafeArea(
        child: Stack(
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
      ),
    );
  }
}

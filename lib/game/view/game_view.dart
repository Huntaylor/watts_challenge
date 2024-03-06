import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/game.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameCubit>(
          create: (context) => GameCubit(),
        ),
      ],
      child: MaterialApp.router(
        builder: (context, child) => const GameView(),
        theme: ThemeData(
          textTheme: GoogleFonts.pixelifySansTextTheme(),
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GameWidget<WattsChallenge>.controlled(
            gameFactory: () => WattsChallenge(
              gameCubit: context.read<GameCubit>(),
            ),
            // gameFactory: WattsChallenge.new,
            overlayBuilderMap: const {},
          ),
        ],
      ),
    );
  }
}

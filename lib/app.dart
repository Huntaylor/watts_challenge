import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/app/view/main_menu.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

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
      child: MaterialApp(
        theme: ThemeData(
          textTheme: WattsChallengeTheme.standard.textTheme,
        ),
        home: const MainMenu(),
      ),
    );
  }
}

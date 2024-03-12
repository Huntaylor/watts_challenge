import 'package:app_ui/app_ui.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:environment_hackaton/app/view/main_menu.dart';
import 'package:environment_hackaton/game/cubit/audio/audio_cubit.dart';
import 'package:environment_hackaton/game/cubit/game/game_cubit.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AudioCache audioCache = AudioCache(prefix: 'assets/audio/');
  @override
  void setState(VoidCallback fn) {
    audioCache.loadAll([AssetConst.bgm, AssetConst.sfx]);
    super.setState(fn);
  }

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
        BlocProvider<AudioCubit>(
          create: (_) => AudioCubit(audioCache: audioCache),
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

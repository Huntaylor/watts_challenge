import 'package:environment_hackaton/game/cubit/cubit.dart';
import 'package:environment_hackaton/l10n/l10n.dart';
import 'package:environment_hackaton/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import 'helpers.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    MockNavigator? navigator,
    PreloadCubit? preloadCubit,
    AudioCubit? audioCubit,
  }) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: preloadCubit ?? MockPreloadCubit()),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: navigator != null
              ? MockNavigatorProvider(navigator: navigator, child: widget)
              : widget,
        ),
      ),
    );
  }
}

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'game_state.dart';
part 'game_cubit.g.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit()
      : super(
          const GameState.initial(),
        );

  void onStartLevel({
    required int gameTimer,
    required int elecUsage,
  }) {
    emit(
      GameStartState(
        gameTimer: gameTimer,
        elecUsage: elecUsage,
      ),
    );
  }
}

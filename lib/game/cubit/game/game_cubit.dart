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

  void startGame() {
    emit(
      const GameStartState(electricUsage: 0),
    );
  }

  void setTotalUsage({
    required double objectUsage,
  }) {
    final newTotalUsage = state.asStarting.electricUsage + objectUsage;
    emit(
      state.asStarting.copyWith(
        electricUsage: newTotalUsage,
      ),
    );
  }

  void addUsage({
    required double objectUsage,
  }) {
    final newTotalUsage = state.asStarting.electricUsage + objectUsage;
    emit(
      state.asStarting.copyWith(
        electricUsage: newTotalUsage,
      ),
    );
  }

  void subtractUsage({
    required double objectUsage,
  }) {
    final newTotalUsage = state.asStarting.electricUsage - objectUsage;
    emit(
      state.asStarting.copyWith(
        electricUsage: newTotalUsage,
      ),
    );
  }
}

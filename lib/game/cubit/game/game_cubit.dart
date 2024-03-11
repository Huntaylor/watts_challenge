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
      const GameStartState(totalElectricUsage: 0, currentUsage: 0),
    );
  }

  void setTotalUsage({
    required double objectUsage,
  }) {
    final newTotalUsage = state.asStarting.totalElectricUsage + objectUsage;
    emit(
      state.asStarting.copyWith(
        totalElectricUsage: newTotalUsage,
        currentUsage: newTotalUsage,
      ),
    );
  }

  void addUsage({
    required double objectUsage,
  }) {
    final newTotalUsage = state.asStarting.currentUsage + objectUsage;
    emit(
      state.asStarting.copyWith(
        currentUsage: newTotalUsage,
      ),
    );
  }

  void subtractUsage({
    required double objectUsage,
  }) {
    final newTotalUsage = state.asStarting.currentUsage - objectUsage;
    emit(
      state.asStarting.copyWith(
        currentUsage: newTotalUsage,
      ),
    );
  }

  Future<void> gameOver(String endTime) async {
    final endingPercentage = state.asStarting.percentage.toStringAsFixed(2);
    print('$endTime, $endingPercentage');
    // Have it finish a few animations
    await Future.delayed(
      const Duration(milliseconds: 10),
      () {
        emit(
          GameEndState(
            percentage: endingPercentage,
            endTime: endTime,
          ),
        );
      },
    );
  }
}

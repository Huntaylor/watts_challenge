part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState();

  const GameState.initial();

  bool get isStarting => this is GameStartState;
  bool get isGameOver => this is GameEndState;
  bool get isLoading => this is LoadingState;

  GameStartState get asStarting => this as GameStartState;
  GameEndState get asGameOver => this as GameEndState;
  LoadingState get asLoading => this as LoadingState;

  @override
  List<Object?> get props => [];
}

@autoequal
@CopyWith()
class GameStartState extends GameState {
  const GameStartState({
    required this.electricUsage,
  });

  const GameStartState.initial() : electricUsage = 0;

  final double electricUsage;

  @override
  List<Object?> get props => _$props;
}

@autoequal
@CopyWith()
class GameEndState extends GameState {
  const GameEndState({
    required this.electricUsage,
    required this.endTime,
  });

  final double electricUsage;
  final String endTime;

  @override
  List<Object?> get props => _$props;
}

class LoadingState extends GameState {
  const LoadingState();
}

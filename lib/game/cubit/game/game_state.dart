part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState();

  const GameState.initial();

  bool get isStarting => this is GameStartState;
  bool get isLoading => this is LoadingState;

  GameStartState get asStarting => this as GameStartState;
  LoadingState get asLoading => this as LoadingState;

  @override
  List<Object?> get props => [];
}

@autoequal
@CopyWith()
class GameStartState extends GameState {
  const GameStartState({
    required this.gameTimer,
    required this.elecUsage,
  });

  const GameStartState.initial()
      : elecUsage = 100,
        gameTimer = 30;

  final int gameTimer;
  final int elecUsage;

  @override
  List<Object?> get props => _$props;
}

class LoadingState extends GameState {
  const LoadingState();
}

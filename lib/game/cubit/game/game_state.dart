part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState();

  const GameState.initial();

  bool get isStarting => this is GameStartState;
  bool get isGameOver => this is GameEndState;
  bool get isLoading => this is LoadingState;
  bool get isMainMenu => this is GameMainMenu;

  GameStartState get asStarting => this as GameStartState;
  GameEndState get asGameOver => this as GameEndState;
  LoadingState get asLoading => this as LoadingState;
  GameMainMenu get asMainMenu => this as GameMainMenu;

  @override
  List<Object?> get props => [];
}

@autoequal
@CopyWith()
class GameMainMenu extends GameState {
  const GameMainMenu({
    required this.isSFXOn,
    required this.isMusicOn,
  });

  const GameMainMenu.initial()
      : isSFXOn = true,
        isMusicOn = true;

  final bool isSFXOn;
  final bool isMusicOn;

  @override
  List<Object?> get props => _$props;
}

@autoequal
@CopyWith()
class GameStartState extends GameState {
  const GameStartState({
    required this.totalElectricUsage,
    required this.currentUsage,
    required this.isSFXOn,
    required this.isMusicOn,
  });

  const GameStartState.initial()
      : totalElectricUsage = 0,
        currentUsage = 0,
        isSFXOn = true,
        isMusicOn = true;

  final bool isSFXOn;
  final bool isMusicOn;
  final double totalElectricUsage;
  final double currentUsage;

  double get optimizedUsage {
    return totalElectricUsage * (1 / 2);
  }

  double get percentage {
    return (currentUsage / optimizedUsage) * 100;
  }

  @override
  List<Object?> get props => _$props;
}

@autoequal
@CopyWith()
class GameEndState extends GameState {
  const GameEndState({
    required this.percentage,
    required this.endTime,
  });

  final String percentage;
  final String endTime;

  @override
  List<Object?> get props => _$props;
}

class LoadingState extends GameState {
  const LoadingState();
}

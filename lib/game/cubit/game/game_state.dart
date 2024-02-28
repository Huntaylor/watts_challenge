part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

@autoequal
@CopyWith()
class GameStateState extends GameState {
  const GameStateState({
    required this.gameTimer,
    required this.elecUsage,
  });
  final Timer gameTimer;
  final int elecUsage;

  @override
  List<Object?> get props => _$props;
}

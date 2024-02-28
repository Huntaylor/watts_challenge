part of 'player_cubit.dart';

enum PlayerSprint {
  sprintAvailable,
  sprintUnavailable,
}

class PlayerGameState extends Equatable {
  const PlayerGameState();

  @override
  List<Object?> get props => [];
}

@autoequal
@CopyWith()
class PlayerState extends PlayerGameState {
  const PlayerState({
    required this.sprintState,
  });
  final PlayerSprint sprintState;

  @override
  List<Object?> get props => _$props;
}

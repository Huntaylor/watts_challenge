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
    required this.isInteracting,
  });

  const PlayerState.initial() : isInteracting = false;

  final bool isInteracting;

  @override
  List<Object?> get props => _$props;
}

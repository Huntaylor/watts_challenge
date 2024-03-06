part of 'player_cubit.dart';

enum PlayerSprint {
  sprintAvailable,
  sprintUnavailable,
}

class PlayerGameState extends Equatable {
  const PlayerGameState();

  bool get isInitial => this is PlayerInteractionState;

  PlayerInteractionState get asInitial => this as PlayerInteractionState;

  @override
  List<Object?> get props => [];
}

@autoequal
@CopyWith()
class PlayerInteractionState extends PlayerGameState {
  const PlayerInteractionState({
    required this.isInteracting,
  });

  const PlayerInteractionState.initial() : isInteracting = false;

  final bool isInteracting;

  @override
  List<Object?> get props => _$props;
}

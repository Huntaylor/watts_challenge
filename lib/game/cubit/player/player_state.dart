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
    required this.isWithinRange,
    required this.objectInteractionTime,
    required this.timerState,
  });

  const PlayerInteractionState.initial()
      : isInteracting = false,
        isWithinRange = false,
        objectInteractionTime = 5,
        timerState = TimerState.initial;

  final bool isInteracting;
  final bool isWithinRange;
  final TimerState timerState;
  final double objectInteractionTime;

  @override
  List<Object?> get props => _$props;
}

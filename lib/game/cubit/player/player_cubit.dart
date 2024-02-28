import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'player_state.dart';
part 'player_cubit.g.dart';

class PlayerCubit extends Cubit<PlayerGameState> {
  PlayerCubit()
      : super(
          const PlayerState(
            sprintState: PlayerSprint.sprintAvailable,
          ),
        );
}

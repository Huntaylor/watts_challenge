import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'player_state.dart';
part 'player_cubit.g.dart';

class PlayerGameCubit extends Cubit<PlayerGameState> {
  PlayerGameCubit()
      : super(
          const PlayerInteractionState.initial(),
        );

  void getIntercation({required bool isInteracting}) {
    emit(
      state.asInitial.copyWith(
        isInteracting: isInteracting,
      ),
    );
  }
}

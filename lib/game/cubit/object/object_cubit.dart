import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'object_state.dart';

class ObjectCubitCubit extends Cubit<ObjectCubitState> {
  ObjectCubitCubit() : super(const ObjectCubitState());
}

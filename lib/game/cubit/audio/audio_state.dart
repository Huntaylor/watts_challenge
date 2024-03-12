part of 'audio_cubit.dart';

@autoequal
@CopyWith()
class AudioState extends Equatable {
  const AudioState({this.volume = 1});
  final double volume;

  @override
  List<Object?> get props => _$props;
}

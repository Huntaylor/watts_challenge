part of 'preload_cubit.dart';

/// State for [PreloadCubit].

@autoequal
@CopyWith()
class PreloadState extends Equatable {
  const PreloadState(
    this.loadedCount,
    this.currentLabel,
    this.totalCount,
  );

  /// Create a [PreloadState] with initial conditions.
  const PreloadState.initial()
      : totalCount = 0,
        loadedCount = 0,
        currentLabel = '';

  /// The total count of load phases to be completed
  final int totalCount;

  /// The count of load phases that were completed so far
  final int loadedCount;

  /// A description of what is being loaded
  final String currentLabel;

  double get progress => totalCount == 0 ? 0 : loadedCount / totalCount;

  bool get isComplete => progress == 1.0;

  @override
  List<Object?> get props => [];
}

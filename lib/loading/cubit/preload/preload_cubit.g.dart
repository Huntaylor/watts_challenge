// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preload_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$PreloadStateAutoequal on PreloadState {
  List<Object?> get _$props => [
        totalCount,
        loadedCount,
        currentLabel,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PreloadStateCWProxy {
  PreloadState loadedCount(int loadedCount);

  PreloadState currentLabel(String currentLabel);

  PreloadState totalCount(int totalCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreloadState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreloadState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreloadState call({
    int? loadedCount,
    String? currentLabel,
    int? totalCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPreloadState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPreloadState.copyWith.fieldName(...)`
class _$PreloadStateCWProxyImpl implements _$PreloadStateCWProxy {
  const _$PreloadStateCWProxyImpl(this._value);

  final PreloadState _value;

  @override
  PreloadState loadedCount(int loadedCount) => this(loadedCount: loadedCount);

  @override
  PreloadState currentLabel(String currentLabel) =>
      this(currentLabel: currentLabel);

  @override
  PreloadState totalCount(int totalCount) => this(totalCount: totalCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreloadState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreloadState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreloadState call({
    Object? loadedCount = const $CopyWithPlaceholder(),
    Object? currentLabel = const $CopyWithPlaceholder(),
    Object? totalCount = const $CopyWithPlaceholder(),
  }) {
    return PreloadState(
      loadedCount == const $CopyWithPlaceholder() || loadedCount == null
          ? _value.loadedCount
          // ignore: cast_nullable_to_non_nullable
          : loadedCount as int,
      currentLabel == const $CopyWithPlaceholder() || currentLabel == null
          ? _value.currentLabel
          // ignore: cast_nullable_to_non_nullable
          : currentLabel as String,
      totalCount == const $CopyWithPlaceholder() || totalCount == null
          ? _value.totalCount
          // ignore: cast_nullable_to_non_nullable
          : totalCount as int,
    );
  }
}

extension $PreloadStateCopyWith on PreloadState {
  /// Returns a callable class that can be used as follows: `instanceOfPreloadState.copyWith(...)` or like so:`instanceOfPreloadState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PreloadStateCWProxy get copyWith => _$PreloadStateCWProxyImpl(this);
}

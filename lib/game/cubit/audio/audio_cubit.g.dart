// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AudioStateAutoequal on AudioState {
  List<Object?> get _$props => [volume];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AudioStateCWProxy {
  AudioState volume(double volume);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AudioState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AudioState(...).copyWith(id: 12, name: "My name")
  /// ````
  AudioState call({
    double? volume,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAudioState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAudioState.copyWith.fieldName(...)`
class _$AudioStateCWProxyImpl implements _$AudioStateCWProxy {
  const _$AudioStateCWProxyImpl(this._value);

  final AudioState _value;

  @override
  AudioState volume(double volume) => this(volume: volume);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AudioState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AudioState(...).copyWith(id: 12, name: "My name")
  /// ````
  AudioState call({
    Object? volume = const $CopyWithPlaceholder(),
  }) {
    return AudioState(
      volume: volume == const $CopyWithPlaceholder() || volume == null
          ? _value.volume
          // ignore: cast_nullable_to_non_nullable
          : volume as double,
    );
  }
}

extension $AudioStateCopyWith on AudioState {
  /// Returns a callable class that can be used as follows: `instanceOfAudioState.copyWith(...)` or like so:`instanceOfAudioState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AudioStateCWProxy get copyWith => _$AudioStateCWProxyImpl(this);
}

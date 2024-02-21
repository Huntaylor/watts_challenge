/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPlayerGen get player => const $AssetsImagesPlayerGen();

  /// File path: assets/images/tilemap_layout.png
  AssetGenImage get tilemapLayout =>
      const AssetGenImage('assets/images/tilemap_layout.png');

  /// List of all assets
  List<AssetGenImage> get values => [tilemapLayout];
}

class $AssetsTilesGen {
  const $AssetsTilesGen();

  /// File path: assets/tiles/house_1.tmx
  String get house1 => 'assets/tiles/house_1.tmx';

  /// File path: assets/tiles/tilemap_layout.json
  String get tilemapLayout => 'assets/tiles/tilemap_layout.json';

  /// File path: assets/tiles/watts_challenge.tiled-project
  String get wattsChallengeTiledProject =>
      'assets/tiles/watts_challenge.tiled-project';

  /// File path: assets/tiles/watts_challenge.tiled-session
  String get wattsChallengeTiledSession =>
      'assets/tiles/watts_challenge.tiled-session';

  /// List of all assets
  List<String> get values => [
        house1,
        tilemapLayout,
        wattsChallengeTiledProject,
        wattsChallengeTiledSession
      ];
}

class $AssetsImagesPlayerGen {
  const $AssetsImagesPlayerGen();

  /// File path: assets/images/player/idle.png
  AssetGenImage get idle =>
      const AssetGenImage('assets/images/player/idle.png');

  /// File path: assets/images/player/player_idle_really.aseprite
  String get playerIdleReally =>
      'assets/images/player/player_idle_really.aseprite';

  /// File path: assets/images/player/reallyForward.png
  AssetGenImage get reallyForward =>
      const AssetGenImage('assets/images/player/reallyForward.png');

  /// File path: assets/images/player/reallyIdle.png
  AssetGenImage get reallyIdle =>
      const AssetGenImage('assets/images/player/reallyIdle.png');

  /// File path: assets/images/player/walkingBack.png
  AssetGenImage get walkingBack =>
      const AssetGenImage('assets/images/player/walkingBack.png');

  /// File path: assets/images/player/walkingForward.png
  AssetGenImage get walkingForward =>
      const AssetGenImage('assets/images/player/walkingForward.png');

  /// File path: assets/images/player/walkingLeft.png
  AssetGenImage get walkingLeft =>
      const AssetGenImage('assets/images/player/walkingLeft.png');

  /// File path: assets/images/player/walkingRight.png
  AssetGenImage get walkingRight =>
      const AssetGenImage('assets/images/player/walkingRight.png');

  /// List of all assets
  List<dynamic> get values => [
        idle,
        playerIdleReally,
        reallyForward,
        reallyIdle,
        walkingBack,
        walkingForward,
        walkingLeft,
        walkingRight
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTilesGen tiles = $AssetsTilesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

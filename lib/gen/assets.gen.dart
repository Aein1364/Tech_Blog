/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  $AssetsImgIconsGen get icons => const $AssetsImgIconsGen();

  /// File path: assets/img/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/img/logo.png');

  /// File path: assets/img/monkey.svg
  SvgGenImage get monkey => const SvgGenImage('assets/img/monkey.svg');

  /// File path: assets/img/podcast1.png
  AssetGenImage get podcast1 => const AssetGenImage('assets/img/podcast1.png');

  /// File path: assets/img/podcast2.png
  AssetGenImage get podcast2 => const AssetGenImage('assets/img/podcast2.png');

  /// File path: assets/img/podcast3.png
  AssetGenImage get podcast3 => const AssetGenImage('assets/img/podcast3.png');

  /// File path: assets/img/podcast4.png
  AssetGenImage get podcast4 => const AssetGenImage('assets/img/podcast4.png');

  /// File path: assets/img/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/img/profile.png');

  /// File path: assets/img/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/img/programming.png');

  /// File path: assets/img/sad monkey.png
  AssetGenImage get sadMonkey =>
      const AssetGenImage('assets/img/sad monkey.png');

  /// File path: assets/img/tag1.png
  AssetGenImage get tag1 => const AssetGenImage('assets/img/tag1.png');

  /// File path: assets/img/tag2.png
  AssetGenImage get tag2 => const AssetGenImage('assets/img/tag2.png');

  /// List of all assets
  List<dynamic> get values => [
        logo,
        monkey,
        podcast1,
        podcast2,
        podcast3,
        podcast4,
        profile,
        programming,
        sadMonkey,
        tag1,
        tag2
      ];
}

class $AssetsImgIconsGen {
  const $AssetsImgIconsGen();

  /// File path: assets/img/icons/article editing.png
  AssetGenImage get articleEditing =>
      const AssetGenImage('assets/img/icons/article editing.png');

  /// File path: assets/img/icons/authorImage.png
  AssetGenImage get authorImage =>
      const AssetGenImage('assets/img/icons/authorImage.png');

  /// File path: assets/img/icons/edit.png
  AssetGenImage get edit => const AssetGenImage('assets/img/icons/edit.png');

  /// File path: assets/img/icons/flesh.svg
  SvgGenImage get flesh => const SvgGenImage('assets/img/icons/flesh.svg');

  /// File path: assets/img/icons/hashtag.png
  AssetGenImage get hashtag =>
      const AssetGenImage('assets/img/icons/hashtag.png');

  /// File path: assets/img/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/img/icons/home.png');

  /// File path: assets/img/icons/microphone.png
  AssetGenImage get microphone =>
      const AssetGenImage('assets/img/icons/microphone.png');

  /// File path: assets/img/icons/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/img/icons/pen.png');

  /// File path: assets/img/icons/podcast microphone.png
  AssetGenImage get podcastMicrophone =>
      const AssetGenImage('assets/img/icons/podcast microphone.png');

  /// File path: assets/img/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/img/icons/user.png');

  /// List of all assets
  List<dynamic> get values => [
        articleEditing,
        authorImage,
        edit,
        flesh,
        hashtag,
        home,
        microphone,
        pen,
        podcastMicrophone,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      // clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

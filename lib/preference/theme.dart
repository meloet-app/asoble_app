import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';

// 日本オンリーの場合は固定で
const Locale kLocale = const Locale("ja", "JP");

// AndroidとiOSでフォントが違う
const String kFontFamilyAndroid = null;
const String kFontFamilyCupertino = "Hiragino Sans";

final bool _android = defaultTargetPlatform == TargetPlatform.android;

final String _kFontFamily = _android ? kFontFamilyAndroid : kFontFamilyCupertino;

final TextTheme _whiteTextTheme = _android ? Typography.whiteMountainView : Typography.whiteCupertino;
final TextTheme _blackTextTheme = _android ? Typography.blackMountainView : Typography.blackCupertino;

// Flutter標準のTextThemeをベースにして
// fontFamilyとlocaleを設定したTextStyleとTextThemeで作る
final Typography kTypography = Typography.material2018(
  platform: defaultTargetPlatform,
  white: _textTheme(_whiteTextTheme),
  black: _textTheme(_blackTextTheme),
  englishLike: _textTheme(Typography.englishLike2014),
  dense: _textTheme(Typography.dense2014),
  tall: _textTheme(Typography.tall2014),
);

TextStyle _textStyle(TextStyle base) {
  return base.copyWith(
    fontFamily: _kFontFamily,
    locale: kLocale,
    textBaseline: TextBaseline.ideographic,
  );
}

TextTheme _textTheme(TextTheme base) {
  return base.copyWith(
    display4: _textStyle(base.display4),
    display3: _textStyle(base.display3),
    display2: _textStyle(base.display2),
    display1: _textStyle(base.display1),
    headline: _textStyle(base.headline),
    title: _textStyle(base.title),
    subhead: _textStyle(base.subhead),
    body2: _textStyle(base.body2),
    body1: _textStyle(base.body1),
    caption: _textStyle(base.caption),
    button: _textStyle(base.button),
    overline: _textStyle(base.overline),
  );
}

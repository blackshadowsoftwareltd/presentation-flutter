import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get text => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  Size get size => mq.size;
  double get width => size.width;
  double get height => size.height;
  double get shortestSide => mq.size.shortestSide;
  double get longestSide => mq.size.longestSide;

  double get txtSize => 22 - (7 * mq.textScaleFactor);

  Orientation get orientation => mq.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPhone => shortestSide < 600;
  bool get isTablet => shortestSide >= 600 && shortestSide < 900;
  bool get isDesktop => shortestSide >= 900;
  bool get isSmallPhone => isPhone && shortestSide < 400;
  bool get isLargePhone => isPhone && shortestSide >= 400;
  bool get isSmallTablet => isTablet && shortestSide < 700;
  bool get isLargeTablet => isTablet && shortestSide >= 700;
  bool get isSmallDesktop => isDesktop && shortestSide < 1200;
  bool get isLargeDesktop => isDesktop && shortestSide >= 1200;
  bool get isSmall => isSmallPhone || isSmallTablet || isSmallDesktop;
  bool get isLarge => isLargePhone || isLargeTablet || isLargeDesktop;

  Future<T?> push<T>(Widget page) =>
      Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushNamed<T>(String page, [Object? args]) =>
      Navigator.of(this).pushNamed<T>(page, arguments: args);

  Future<T?> pushAndRemoveUntil<T>(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);

  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  void showMountedSnackBar(SnackBar snackBar) => mounted
      ? ScaffoldMessenger.of(this).showSnackBar(snackBar)
      : debugPrint('Context is not mounted. SnackBar not shown.');

  ScreenType get screenType =>
      width > 800 ? ScreenType.desktop : ScreenType.mobile;

  bool get isScreenDesktop => screenType == ScreenType.desktop;
  bool get isScreenMobile => screenType == ScreenType.mobile;
}

enum ScreenType { mobile, desktop }

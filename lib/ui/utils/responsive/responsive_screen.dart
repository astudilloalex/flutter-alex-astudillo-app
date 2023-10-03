import 'dart:io';

import 'package:alex_astudillo/ui/utils/extensions/context_extension.dart';
import 'package:alex_astudillo/ui/utils/responsive/responsive_screen_settings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ResponsiveScreen {
  /// Factory that return always the same instance.
  factory ResponsiveScreen() => _instance ??= ResponsiveScreen._();

  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension
  ResponsiveScreen._();

  /// The screen settings.
  ResponsiveScreenSettings _settings = const ResponsiveScreenSettings();

  /// Customize your own settings.
  void setCustomSettings({
    ResponsiveScreenSettings? settings,
  }) {
    if (settings != null) _settings = settings;
  }

  // Use for singleton instance.
  static ResponsiveScreen? _instance;

  /// Is [screenType] [ScreenType.desktop]
  bool isDesktop(BuildContext context) =>
      screenType(context) == ScreenType.desktop;

  /// Is [screenType] [ScreenType.tablet]
  bool isTablet(BuildContext context) =>
      screenType(context) == ScreenType.tablet;

  /// Is [screenType] [ScreenType.phone]
  bool isPhone(BuildContext context) => screenType(context) == ScreenType.phone;

  /// Is [screenType] [ScreenType.watch]
  bool isWatch(BuildContext context) => screenType(context) == ScreenType.watch;

  /// Get the screen type based on the [context].
  ScreenType screenType(BuildContext context) {
    final bool isDesktop =
        kIsWeb || Platform.isMacOS || Platform.isWindows || Platform.isLinux;
    final double width =
        isDesktop ? context.width : context.mediaQueryShortestSide;
    if (width >= _settings.desktopChangePoint) return ScreenType.desktop;
    if (width >= _settings.tabletChangePoint) return ScreenType.tablet;
    if (width < _settings.watchChangePoint) return ScreenType.watch;
    return ScreenType.phone;
  }

  ResponsiveScreenSettings get settings => _settings;
}

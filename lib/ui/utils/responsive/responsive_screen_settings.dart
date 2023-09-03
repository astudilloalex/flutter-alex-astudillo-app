/// Settings for responsive apps or adaptative.
class ResponsiveScreenSettings {
  const ResponsiveScreenSettings({
    this.desktopChangePoint = 1100,
    this.tabletChangePoint = 700,
    this.watchChangePoint = 300,
  });

  /// When the width is greater to this value
  /// the display will be set as [ScreenType.desktop]
  final double desktopChangePoint;

  /// When the width is greater to this value
  /// the display will be set as [ScreenType.tablet]
  /// or when width greater als [watchChangePoint] and smaller als this value
  /// the display will be [ScreenType.phone]
  final double tabletChangePoint;

  /// When the width is smaller to this value
  /// the display will be set as [ScreenType.watch]
  /// or when width greater als this value and smaller als [tabletChangePoint]
  /// the display will be [ScreenType.phone]
  final double watchChangePoint;
}

/// The enum of the available screen types.
enum ScreenType {
  watch,
  phone,
  tablet,
  desktop,
}

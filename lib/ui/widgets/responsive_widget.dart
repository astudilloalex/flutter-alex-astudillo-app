import 'package:alex_astudillo/ui/utils/responsive/responsive_screen.dart';
import 'package:alex_astudillo/ui/utils/responsive/responsive_screen_settings.dart';
import 'package:flutter/widgets.dart';

class ResponsiveWidget extends StatelessWidget {
  /// Build a responsive widget.
  const ResponsiveWidget({
    super.key,
    this.builder,
    this.desktop,
    this.phone,
    this.tablet,
    this.watch,
  }) : assert(
          builder != null ||
              desktop != null ||
              phone != null ||
              tablet != null ||
              watch != null,
          'You need add at least one widget',
        );

  /// This widget has priority over all other widgets.
  ///
  /// Use for custom your own design for each device.
  final Widget? builder;

  /// Widget to display in desktop screen.
  final Widget? desktop;

  /// Widget to display in phone screen.
  final Widget? phone;

  /// Widget to display in tablet screen.
  final Widget? tablet;

  /// Widget to display on watch screen.
  final Widget? watch;

  @override
  Widget build(BuildContext context) {
    if (builder != null) return builder!;
    final ScreenType type = ResponsiveScreen().screenType(context);
    if (type == ScreenType.desktop) return desktop ?? tablet ?? phone ?? watch!;
    if (type == ScreenType.tablet) return tablet ?? phone ?? watch ?? desktop!;
    if (type == ScreenType.phone) return phone ?? watch ?? tablet ?? desktop!;
    return watch ?? phone ?? tablet ?? desktop!;
  }
}

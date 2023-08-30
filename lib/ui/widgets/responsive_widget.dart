import 'package:flutter/widgets.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    this.desktop,
    this.phone,
    this.tablet,
  }) : assert(desktop != null || phone != null || tablet != null);

  /// Widget to display in desktop screen.
  final Widget? desktop;

  /// Widget to display in phone screen.
  final Widget? phone;

  /// Widget to display in tablet screen.
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000.0) {
          return desktop ?? tablet ?? phone!;
        }
        if (constraints.maxWidth >= 767.98) {
          return tablet ?? phone ?? desktop!;
        }
        return phone ?? tablet ?? desktop!;
      },
    );
  }
}

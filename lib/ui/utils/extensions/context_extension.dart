import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Get the size of the screen.
  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  /// Get the height of the screen.
  double get height => mediaQuerySize.height;

  /// Get the width of the screen.
  double get width => mediaQuerySize.width;

  /// Get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;
}

import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData._();

  static final ThemeData dark = ThemeData.dark().copyWith(
    useMaterial3: true,
  );

  static final ThemeData light = ThemeData.light().copyWith(
    useMaterial3: true,
  );
}

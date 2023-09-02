import 'package:alex_astudillo/ui/routes/route_page.dart';
import 'package:alex_astudillo/ui/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: RoutePage.router,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeData.light,
    );
  }
}

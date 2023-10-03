import 'package:alex_astudillo/app/services/get_it_service.dart';
import 'package:alex_astudillo/ui/routes/route_page.dart';
import 'package:alex_astudillo/ui/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitPulsingGrid(
          color: Colors.white,
        ),
      ),
      overlayColor: Colors.black.withOpacity(0.7),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        darkTheme: AppThemeData.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: RoutePage.router,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppThemeData.light,
      ),
    );
  }
}

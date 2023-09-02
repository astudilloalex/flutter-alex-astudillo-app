import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.home_outlined),
                  label: Text(AppLocalizations.of(context)!.home),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.person_outlined),
                  label: Text(AppLocalizations.of(context)!.profile),
                ),
              ],
              selectedIndex: 0,
            ),
            const Expanded(child: Text('Data')),
          ],
        ),
      ),
    );
  }
}

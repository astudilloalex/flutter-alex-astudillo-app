import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePhonePage extends StatelessWidget {
  const HomePhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Data'),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outlined),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}

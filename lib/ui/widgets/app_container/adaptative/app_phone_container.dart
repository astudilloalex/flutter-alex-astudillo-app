import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:alex_astudillo/ui/widgets/app_container/cubits/app_container_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AppPhoneContainer extends StatelessWidget {
  const AppPhoneContainer({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          final int currentIndex =
              context.read<AppContainerCubit>().state.currentIndex;
          switch (value) {
            case 0:
              if (currentIndex != 0) context.goNamed(RouteName.home);
            case 1:
              if (currentIndex != 1) context.goNamed(RouteName.profile);
          }
          context.read<AppContainerCubit>().updateIndex(value);
        },
        selectedIndex: context.watch<AppContainerCubit>().state.currentIndex,
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

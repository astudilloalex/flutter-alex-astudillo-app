import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:alex_astudillo/ui/widgets/app_container/cubits/app_container_cubit.dart';
import 'package:alex_astudillo/ui/widgets/app_container/states/app_container_state.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ContainerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ContainerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocSelector<AppContainerCubit, AppContainerState, List<Company>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return TextButton(
              onPressed: () => context.goNamed(RouteName.addEditCompany),
              child: Text(AppLocalizations.of(context)!.add),
            );
          }
          return DropdownButton(
            items: state
                .map((e) => DropdownMenuItem(child: Text(e.tradename)))
                .toList(),
            onChanged: (value) {},
          );
        },
        selector: (state) => state.companies,
      ),
      actions: [
        badges.Badge(
          position: badges.BadgePosition.topStart(start: -16.0),
          badgeContent: Text(
            '${context.watch<AppContainerCubit>().state.countNotifications}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          ignorePointer: true,
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(milliseconds: 400),
          ),
          showBadge:
              context.watch<AppContainerCubit>().state.countNotifications > 0,
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.blueGrey,
            elevation: 0,
          ),
          child: IconButton(
            onPressed: () {
              context.read<AppContainerCubit>().changeNotifications();
            },
            icon:
                context.watch<AppContainerCubit>().state.countNotifications > 0
                    ? const Icon(Icons.notifications)
                    : const Icon(Icons.notifications_outlined),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

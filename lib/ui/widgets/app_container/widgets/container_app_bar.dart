import 'package:alex_astudillo/ui/widgets/app_container/cubits/app_container_cubit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ContainerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            icon: const Icon(Icons.notifications_outlined),
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

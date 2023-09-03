import 'package:alex_astudillo/ui/pages/profile/cubits/profile_cubit.dart';
import 'package:alex_astudillo/ui/pages/profile/states/profile_state.dart';
import 'package:alex_astudillo/ui/pages/profile/widgets/profile_tab_bar.dart';
import 'package:alex_astudillo/ui/pages/profile/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDesktopPage extends StatelessWidget {
  const ProfileDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              const UserAvatar(),
              Center(
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Text(
                      state.user.displayName ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const Expanded(child: ProfileTabBar()),
            ],
          ),
        ),
        const VerticalDivider(width: 0.0),
        Expanded(child: SizedBox()),
      ],
    );
  }
}

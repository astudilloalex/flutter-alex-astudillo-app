import 'package:alex_astudillo/ui/pages/profile/cubits/profile_cubit.dart';
import 'package:alex_astudillo/ui/pages/profile/states/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.user.photoUrl != null) {
            return CircleAvatar(
              foregroundImage: NetworkImage(state.user.photoUrl!),
              radius: 35.0,
              backgroundColor: Colors.black12,
            );
          }
          return const CircleAvatar(
            radius: 35.0,
            backgroundColor: Colors.black12,
            child: Icon(Icons.person_outlined),
          );
        },
      ),
    );
  }
}

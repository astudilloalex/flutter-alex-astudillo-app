import 'package:alex_astudillo/ui/pages/profile/cubits/profile_detail_cubit.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:alex_astudillo/ui/utils/responsive/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(AppLocalizations.of(context)!.aboutYou),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          onTap: () {
            if (ResponsiveScreen().isPhone(context)) {
              context.push(RouteName.editProfile);
            } else {
              context.read<ProfileDetailCubit>().changeIndex(0);
            }
          },
          selected:
              context.watch<ProfileDetailCubit>().state.currentMenuIndex == 0 &&
                  !ResponsiveScreen().isPhone(context),
          title: Text(AppLocalizations.of(context)!.editProfile),
          leading: const Icon(Icons.person_outlined),
          trailing: ResponsiveScreen().isPhone(context)
              ? Icon(Icons.adaptive.arrow_forward_outlined)
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(height: 0.0),
        ),
        const SizedBox(height: 16.0),
        // Verification section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(AppLocalizations.of(context)!.verification),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          onTap: () {},
          title: Text(AppLocalizations.of(context)!.verifyIdentification),
          leading: const Icon(Icons.card_giftcard_outlined),
          trailing: ResponsiveScreen().isPhone(context)
              ? Icon(Icons.adaptive.arrow_forward_outlined)
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(height: 0.0),
        ),
        ListTile(
          onTap: () {},
          title: Text(AppLocalizations.of(context)!.verifyEmail),
          leading: const Icon(Icons.email_outlined),
          trailing: ResponsiveScreen().isPhone(context)
              ? Icon(Icons.adaptive.arrow_forward_outlined)
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(height: 0.0),
        ),
        ListTile(
          onTap: () {},
          title: Text(AppLocalizations.of(context)!.addPhone),
          leading: const Icon(Icons.phone_iphone_outlined),
          trailing: ResponsiveScreen().isPhone(context)
              ? Icon(Icons.adaptive.arrow_forward_outlined)
              : null,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

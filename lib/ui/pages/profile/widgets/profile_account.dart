import 'package:alex_astudillo/ui/utils/responsive/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileAccount extends StatelessWidget {
  const ProfileAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(AppLocalizations.of(context)!.preferences),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          onTap: () {},
          title: Text(AppLocalizations.of(context)!.notifications),
          leading: const Icon(Icons.notifications_outlined),
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
          title: Text(AppLocalizations.of(context)!.changePassword),
          leading: const Icon(Icons.password_outlined),
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
          title: Text(AppLocalizations.of(context)!.address),
          leading: const Icon(Icons.markunread_mailbox_outlined),
          trailing: ResponsiveScreen().isPhone(context)
              ? Icon(Icons.adaptive.arrow_forward_outlined)
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(height: 0.0),
        ),
      ],
    );
  }
}

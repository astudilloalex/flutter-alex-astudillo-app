import 'package:alex_astudillo/ui/utils/responsive/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          onTap: () {},
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

import 'package:alex_astudillo/ui/pages/profile/adaptative/profile_desktop_page.dart';
import 'package:alex_astudillo/ui/pages/profile/adaptative/profile_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: ProfileDesktopPage(),
      phone: ProfilePhonePage(),
      tablet: ProfileDesktopPage(),
    );
  }
}

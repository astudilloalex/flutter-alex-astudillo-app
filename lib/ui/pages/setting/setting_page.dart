import 'package:alex_astudillo/ui/pages/setting/adaptative/setting_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: SettingPhonePage(),
    );
  }
}

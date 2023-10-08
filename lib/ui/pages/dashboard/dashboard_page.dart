import 'package:alex_astudillo/ui/pages/dashboard/adaptative/dashboard_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: DashboardPhonePage(),
    );
  }
}

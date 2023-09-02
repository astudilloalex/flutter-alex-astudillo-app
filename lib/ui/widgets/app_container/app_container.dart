import 'package:alex_astudillo/ui/widgets/app_container/adaptative/app_desktop_container.dart';
import 'package:alex_astudillo/ui/widgets/app_container/adaptative/app_phone_container.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktop: AppDesktopContainer(body: body),
      phone: AppPhoneContainer(body: body),
    );
  }
}

import 'package:alex_astudillo/ui/pages/company/adaptative/company_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: CompanyPhonePage(),
    );
  }
}

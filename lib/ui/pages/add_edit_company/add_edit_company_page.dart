import 'package:alex_astudillo/ui/pages/add_edit_company/adaptative/add_edit_company_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class AddEditCompanyPage extends StatelessWidget {
  const AddEditCompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: AddEditCompanyPhonePage(),
    );
  }
}

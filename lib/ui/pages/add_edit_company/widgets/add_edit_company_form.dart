import 'package:alex_astudillo/ui/pages/add_edit_company/cubits/add_edit_company_cubit.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/widgets/adaptative/phone/company_phone_form.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditCompanyForm extends StatelessWidget {
  const AddEditCompanyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AddEditCompanyCubit cubit = context.read<AddEditCompanyCubit>();
    return ResponsiveWidget(
      phone: Column(
        children: [
          CompanyPhoneForm(
            useActionButtons: false,
            onChangeData: (value) => cubit.company = value,
          ),
        ],
      ),
    );
  }
}

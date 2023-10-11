import 'package:alex_astudillo/ui/pages/add_edit_company/cubits/add_edit_company_cubit.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/widgets/adaptative/phone/company_phone_form.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/widgets/adaptative/phone/person_phone_form.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/widgets/add_edit_company_action.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(),
                ),
                margin: const EdgeInsets.only(top: 10.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 20.0,
                  ),
                  child: PersonPhoneForm(
                    useActionButtons: false,
                    onChangeData: (value) => cubit.person = value,
                  ),
                ),
              ),
              Positioned(
                left: 15.0,
                top: 0.0,
                child: Text(
                  AppLocalizations.of(context)!.legalReason,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const AddEditCompanyAction(),
        ],
      ),
    );
  }
}

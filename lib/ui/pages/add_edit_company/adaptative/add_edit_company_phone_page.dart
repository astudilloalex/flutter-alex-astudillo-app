import 'package:alex_astudillo/ui/pages/add_edit_company/cubits/add_edit_company_cubit.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/widgets/add_edit_company_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddEditCompanyPhonePage extends StatelessWidget {
  const AddEditCompanyPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? code = context.read<AddEditCompanyCubit>().code;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          code == null
              ? AppLocalizations.of(context)!.addCompany
              : AppLocalizations.of(context)!.editCompany,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16.0),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450.0),
              child: const AddEditCompanyForm(),
            ),
          ),
        ],
      ),
    );
  }
}

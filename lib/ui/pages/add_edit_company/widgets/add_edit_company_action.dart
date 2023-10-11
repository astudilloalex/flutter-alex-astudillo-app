import 'package:alex_astudillo/ui/pages/add_edit_company/cubits/add_edit_company_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddEditCompanyAction extends StatelessWidget {
  const AddEditCompanyAction({super.key});

  @override
  Widget build(BuildContext context) {
    final String? code = context.read<AddEditCompanyCubit>().companyCode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            code == null ? Icons.save_outlined : Icons.update_outlined,
          ),
          label: Text(
            code == null
                ? AppLocalizations.of(context)!.save
                : AppLocalizations.of(context)!.update,
          ),
        ),
        const SizedBox(width: 16.0),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.cancel_outlined),
          label: Text(AppLocalizations.of(context)!.cancel),
        ),
      ],
    );
  }
}

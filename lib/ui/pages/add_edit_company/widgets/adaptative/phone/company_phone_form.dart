import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyPhoneForm extends StatefulWidget {
  const CompanyPhoneForm({
    super.key,
    this.onChangeData,
    this.onCancel,
    this.onSave,
    this.useActionButtons = true,
  }) : assert(
          (useActionButtons && onSave != null && onCancel != null) ||
              (!useActionButtons && onChangeData != null),
        );

  final ValueChanged<Company?>? onChangeData;
  final ValueChanged<Company?>? onSave;
  final VoidCallback? onCancel;
  final bool useActionButtons;

  @override
  State<CompanyPhoneForm> createState() => _CompanyPhoneFormState();
}

class _CompanyPhoneFormState extends State<CompanyPhoneForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController tradenameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Company company = const Company();

  @override
  void initState() {
    super.initState();
    if (!widget.useActionButtons && widget.onChangeData != null) {
      tradenameController.addListener(() {
        widget.onChangeData!(
          !formKey.currentState!.validate()
              ? null
              : company.copyWith(tradename: tradenameController.text),
        );
      });
      descriptionController.addListener(() {
        widget.onChangeData!(
          !formKey.currentState!.validate()
              ? null
              : company.copyWith(description: descriptionController.text),
        );
      });
    }
  }

  @override
  void dispose() {
    tradenameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: tradenameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.tradename,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.description,
            ),
            maxLength: 255,
            minLines: 2,
            maxLines: 5,
          ),
          const SizedBox(height: 16.0),
          if (widget.useActionButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    widget.onSave?.call(
                      !formKey.currentState!.validate()
                          ? null
                          : company.copyWith(
                              tradename: tradenameController.text,
                              description: descriptionController.text,
                            ),
                    );
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: Text(AppLocalizations.of(context)!.save),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton.icon(
                  onPressed: widget.onCancel,
                  icon: const Icon(Icons.cancel_outlined),
                  label: Text(AppLocalizations.of(context)!.cancel),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

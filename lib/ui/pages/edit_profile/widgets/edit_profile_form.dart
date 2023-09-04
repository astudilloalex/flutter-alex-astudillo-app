import 'package:alex_astudillo/ui/widgets/responsive/responsive_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController namesController = TextEditingController();
  final TextEditingController surnamesController = TextEditingController();
  final TextEditingController socialReasonController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

  @override
  void dispose() {
    displayNameController.dispose();
    idCardController.dispose();
    namesController.dispose();
    surnamesController.dispose();
    socialReasonController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ResponsiveForm(
        formFields: [
          TextFormField(
            controller: displayNameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.displayName,
            ),
          ),
          TextFormField(
            controller: idCardController,
          ),
          TextFormField(
            controller: namesController,
          ),
          TextFormField(
            controller: surnamesController,
          ),
          TextFormField(
            controller: socialReasonController,
          ),
        ],
      ),
    );
  }
}

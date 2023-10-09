import 'package:alex_astudillo/src/country/domain/country.dart';
import 'package:alex_astudillo/src/person/domain/person.dart';
import 'package:alex_astudillo/src/person_document_type/domain/person_document_type.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/cubits/add_edit_company_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonPhoneForm extends StatefulWidget {
  const PersonPhoneForm({
    super.key,
    this.onChangeData,
    this.onCancel,
    this.onSave,
    this.useActionButtons = true,
  }) : assert(
          (useActionButtons && onSave != null && onCancel != null) ||
              (!useActionButtons && onChangeData != null),
        );

  final ValueChanged<Person?>? onChangeData;
  final ValueChanged<Person?>? onSave;
  final VoidCallback? onCancel;
  final bool useActionButtons;

  @override
  State<PersonPhoneForm> createState() => _PersonPhoneFormState();
}

class _PersonPhoneFormState extends State<PersonPhoneForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController idCardController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController socialReasonController = TextEditingController();

  final Person person = const Person();

  List<Country> countries = [];
  String? selectedCountryCode;
  List<PersonDocumentType> personDocumentTypes = [];
  int? selectedDocumentTypeId;
  bool loading = false;
  bool juridicalPerson = false;

  @override
  void initState() {
    super.initState();
    if (!widget.useActionButtons && widget.onChangeData != null) {
      idCardController.addListener(() {
        widget.onChangeData!(
          !formKey.currentState!.validate()
              ? null
              : person.copyWith(idCard: idCardController.text),
        );
      });
      firstNameController.addListener(() {
        widget.onChangeData!(
          !formKey.currentState!.validate()
              ? null
              : person.copyWith(firstName: firstNameController.text),
        );
      });
      lastNameController.addListener(() {
        widget.onChangeData!(
          !formKey.currentState!.validate()
              ? null
              : person.copyWith(lastName: lastNameController.text),
        );
      });
      socialReasonController.addListener(() {
        widget.onChangeData!(
          !formKey.currentState!.validate()
              ? null
              : person.copyWith(socialReason: socialReasonController.text),
        );
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  @override
  void dispose() {
    idCardController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    socialReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: selectedCountryCode,
            items: countries
                .map(
                  (e) => DropdownMenuItem(
                    value: e.code,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (value) => _updatePersonDocumentTypes(value ?? ''),
            decoration: InputDecoration(
              labelText: loading
                  ? '${AppLocalizations.of(context)!.loading}...'
                  : AppLocalizations.of(context)!.country,
            ),
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<int>(
            value: selectedDocumentTypeId,
            items: personDocumentTypes
                .map(
                  (e) => DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedDocumentTypeId = value;
              });
              widget.onChangeData?.call(
                !formKey.currentState!.validate()
                    ? null
                    : person.copyWith(personDocumentTypeId: value),
              );
            },
            decoration: InputDecoration(
              labelText: loading
                  ? '${AppLocalizations.of(context)!.loading}...'
                  : AppLocalizations.of(context)!.documentType,
            ),
          ),
          const SizedBox(height: 16.0),
          CheckboxListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(),
            ),
            value: juridicalPerson,
            onChanged: (value) {
              setState(() {
                juridicalPerson = value ?? false;
              });
              widget.onChangeData?.call(
                !formKey.currentState!.validate()
                    ? null
                    : person.copyWith(juridicalPerson: value),
              );
            },
            title: Text(AppLocalizations.of(context)!.juridicalPerson),
          ),
          const SizedBox(height: 16.0),
          if (!juridicalPerson)
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.names,
              ),
            ),
          if (!juridicalPerson) const SizedBox(height: 16.0),
          if (!juridicalPerson)
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.surnames,
              ),
            ),
          if (juridicalPerson)
            TextFormField(
              controller: socialReasonController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.socialReason,
              ),
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
                          : person.copyWith(
                              idCard: idCardController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              socialReason: socialReasonController.text,
                              juridicalPerson: juridicalPerson,
                              personDocumentTypeId: selectedDocumentTypeId,
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

  Future<void> _loadData() async {
    final AddEditCompanyCubit cubit = context.read<AddEditCompanyCubit>();
    if (!loading) setState(() => loading = true);
    countries = await cubit.countries;
    if (countries.isNotEmpty) selectedCountryCode = countries.first.code;
    await _updatePersonDocumentTypes(selectedCountryCode ?? '');
    setState(() {
      countries = countries;
      loading = false;
    });
  }

  Future<void> _updatePersonDocumentTypes(String countryCode) async {
    final AddEditCompanyCubit cubit = context.read<AddEditCompanyCubit>();
    if (!loading) setState(() => loading = true);
    personDocumentTypes = await cubit.personDocumentTypes(countryCode);
    setState(() {
      selectedCountryCode = countryCode;
      personDocumentTypes = personDocumentTypes;
      loading = false;
    });
  }
}

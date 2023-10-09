import 'package:alex_astudillo/src/person/domain/person.dart';
import 'package:flutter/material.dart';

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

  final Person person = const Person();

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
    }
  }

  @override
  void dispose() {
    idCardController.dispose();
    firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [],
      ),
    );
  }

  Future<void> loadData() async {}
}

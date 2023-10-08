import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showErrorSnackbar(BuildContext context, String errorCode) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SelectableText(messageFromCode(errorCode, context)),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void showSuccessfulSnackbar(
  BuildContext context,
  String message, {
  int? milliseconds,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SelectableText(messageFromCode(message, context)),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: milliseconds ?? 4000),
    ),
  );
}

String messageFromCode(String code, BuildContext context) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;
  final Map<String, String> errorMessages = {
    'weak-password': localizations.weakPassword,
    'invalid-oob-code': localizations.invalidOobCode,
    'email-not-found': localizations.emailNotFound,
  };
  return errorMessages[code] ?? code;
}

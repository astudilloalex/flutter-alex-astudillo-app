import 'package:alex_astudillo/app/app_asset.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordFormContainer extends StatelessWidget {
  const ForgotPasswordFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.alexAstudilloLogo,
                width: 75.0,
                height: 75.0,
              ),
              const SizedBox(width: 20.0),
              Text(
                AppLocalizations.of(context)!.hello,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppLocalizations.of(context)!.enterYourEmailToResetYourPassword,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ForgotPasswordForm(),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

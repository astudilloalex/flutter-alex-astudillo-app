import 'package:alex_astudillo/app/app_asset.dart';
import 'package:alex_astudillo/ui/pages/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInFormContainer extends StatelessWidget {
  const SignInFormContainer({super.key});

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
              Text.rich(
                TextSpan(
                  text: '${AppLocalizations.of(context)!.welcome}\n',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.letsStart,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SignInForm(),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: Text.rich(
              TextSpan(
                text: '${AppLocalizations.of(context)!.dontHaveAnAccount} ',
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.signUp,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

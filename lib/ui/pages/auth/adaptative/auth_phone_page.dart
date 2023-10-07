import 'package:alex_astudillo/app/app_asset.dart';
import 'package:alex_astudillo/ui/pages/auth/cubits/auth_cubit.dart';
import 'package:alex_astudillo/ui/pages/auth/widgets/auth_change_password_form.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class AuthPhonePage extends StatelessWidget {
  const AuthPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String mode = context.read<AuthCubit>().mode;
    return Scaffold(
      body: context.watch<AuthCubit>().state.loading
          ? SpinKitCircle(
              color: Theme.of(context).primaryColor,
            )
          : Center(
              child: Builder(
                builder: (context) {
                  if (mode == 'resetPassword') {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: Image.asset(
                            AppAsset.changePassword,
                            width: 100.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.changePassword,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400.0),
                            child: const AuthChangePasswordForm(),
                          ),
                        ),
                      ],
                    );
                  }
                  if (mode == 'verifyEmail') {}
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Image.asset(
                          AppAsset.noActionsAvailable,
                          width: 150.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.noAction,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () => context.goNamed(RouteName.home),
                          icon: const Icon(Icons.home),
                          label: Text(AppLocalizations.of(context)!.home),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}

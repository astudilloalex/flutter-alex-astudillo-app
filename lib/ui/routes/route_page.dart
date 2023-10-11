import 'package:alex_astudillo/app/services/get_it_service.dart';
import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/src/company/application/company_service.dart';
import 'package:alex_astudillo/src/country/application/country_service.dart';
import 'package:alex_astudillo/src/person_document_type/application/person_document_type_service.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/add_edit_company_page.dart';
import 'package:alex_astudillo/ui/pages/add_edit_company/cubits/add_edit_company_cubit.dart';
import 'package:alex_astudillo/ui/pages/auth/auth_page.dart';
import 'package:alex_astudillo/ui/pages/auth/cubits/auth_cubit.dart';
import 'package:alex_astudillo/ui/pages/company/company_page.dart';
import 'package:alex_astudillo/ui/pages/company/cubits/company_cubit.dart';
import 'package:alex_astudillo/ui/pages/edit_profile/cubits/edit_profile_cubit.dart';
import 'package:alex_astudillo/ui/pages/edit_profile/edit_profile_page.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/cubits/forgot_password_cubit.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:alex_astudillo/ui/pages/home/cubits/home_cubit.dart';
import 'package:alex_astudillo/ui/pages/home/home_page.dart';
import 'package:alex_astudillo/ui/pages/profile/cubits/profile_cubit.dart';
import 'package:alex_astudillo/ui/pages/profile/cubits/profile_detail_cubit.dart';
import 'package:alex_astudillo/ui/pages/profile/profile_page.dart';
import 'package:alex_astudillo/ui/pages/sign_in/cubits/sign_in_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_in/sign_in_page.dart';
import 'package:alex_astudillo/ui/pages/sign_up/cubits/sign_up_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_up/sign_up_page.dart';
import 'package:alex_astudillo/ui/pages/splash/cubits/splash_cubit.dart';
import 'package:alex_astudillo/ui/pages/splash/splash_page.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:alex_astudillo/ui/widgets/app_container/app_container.dart';
import 'package:alex_astudillo/ui/widgets/app_container/cubits/app_container_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RoutePage {
  const RoutePage._();

  static final GlobalKey<NavigatorState> _shellKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: RouteName.splash,
    navigatorKey: _navigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _navigatorKey,
        path: RouteName.authAction,
        name: RouteName.authAction,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(
            authService: getIt<AuthService>(),
            mode: state.uri.queryParameters['mode'] ?? '',
            oobCode: state.uri.queryParameters['oobCode'] ?? '',
          )..executeAction(),
          child: const AuthPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _navigatorKey,
        path: RouteName.editProfile,
        name: RouteName.editProfile,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit(),
          child: const EditProfilePage(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) {
          int index = 0;
          switch (state.fullPath) {
            case RouteName.profile:
              index = 1;
            default:
              index = 0;
              break;
          }
          return BlocProvider(
            create: (context) => AppContainerCubit(
              currentIndex: index,
              companyService: getIt<CompanyService>(),
            )..load(),
            child: AppContainer(body: child),
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: RouteName.addEditCompany,
            name: RouteName.addEditCompany,
            builder: (context, state) => BlocProvider(
              create: (context) => AddEditCompanyCubit(
                companyService: getIt<CompanyService>(),
                countryService: getIt<CountryService>(),
                personDocumentTypeService: getIt<PersonDocumentTypeService>(),
              ),
              child: const AddEditCompanyPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: RouteName.company,
            name: RouteName.company,
            builder: (context, state) => BlocProvider(
              create: (context) => CompanyCubit(
                companyService: getIt<CompanyService>(),
              ),
              child: const CompanyPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: RouteName.home,
            name: RouteName.home,
            builder: (context, state) => BlocProvider(
              create: (context) => HomeCubit(),
              child: const HomePage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellKey,
            path: RouteName.profile,
            name: RouteName.profile,
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => ProfileCubit()),
                BlocProvider(create: (context) => ProfileDetailCubit()),
              ],
              child: const ProfilePage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: RouteName.forgotPassword,
        name: RouteName.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(
            authService: getIt<AuthService>(),
          ),
          child: const ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        path: RouteName.signIn,
        name: RouteName.signIn,
        builder: (context, state) => BlocProvider(
          create: (context) => SignInCubit(
            authService: getIt<AuthService>(),
          ),
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: RouteName.signUp,
        name: RouteName.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(
            authService: getIt<AuthService>(),
          ),
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: RouteName.splash,
        name: RouteName.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(authService: getIt<AuthService>()),
          child: const SplashPage(),
        ),
      ),
    ],
  );
}

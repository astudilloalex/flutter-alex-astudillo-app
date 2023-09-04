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
    initialLocation: RouteName.signIn,
    navigatorKey: _navigatorKey,
    routes: [
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
            create: (context) => AppContainerCubit(currentIndex: index),
            child: AppContainer(body: child),
          );
        },
        routes: [
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
          create: (context) => ForgotPasswordCubit(),
          child: const ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        path: RouteName.signIn,
        name: RouteName.signIn,
        builder: (context, state) => BlocProvider(
          create: (context) => SignInCubit(),
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: RouteName.signUp,
        name: RouteName.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: RouteName.splash,
        name: RouteName.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(),
          child: const SplashPage(),
        ),
      ),
    ],
  );
}

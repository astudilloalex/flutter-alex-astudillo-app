import 'package:alex_astudillo/ui/pages/home/cubits/home_cubit.dart';
import 'package:alex_astudillo/ui/pages/home/home_page.dart';
import 'package:alex_astudillo/ui/pages/sign_in/cubits/sign_in_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_in/sign_in_page.dart';
import 'package:alex_astudillo/ui/pages/sign_up/cubits/sign_up_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_up/sign_up_page.dart';
import 'package:alex_astudillo/ui/pages/splash/cubits/splash_cubit.dart';
import 'package:alex_astudillo/ui/pages/splash/splash_page.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RoutePage {
  const RoutePage._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteName.signIn,
    routes: [
      GoRoute(
        path: RouteName.home,
        name: RouteName.home,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomePage(),
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

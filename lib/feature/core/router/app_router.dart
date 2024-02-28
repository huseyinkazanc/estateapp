import 'package:estate_flutter_app/product/ui/screen/auth/login/view/login_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/otp/view/otp_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/register/view/register_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login,
  register,
  otp,
  home,
  root,
}

// Extension method to prepend a "/" to route paths
extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.login:
        return '/login';
      case AppRoute.register:
        return '/home';
      case AppRoute.otp:
        return '/otp';
      case AppRoute.home:
        return '/home';
      case AppRoute.root:
        return '/';
    }
  }
}

class AppRouter {
  final bool isUserAuthenticated;

  AppRouter(this.isUserAuthenticated) {
    goRoutes = _initializeRoutes();
  }
  late GoRouter goRoutes;

  GoRouter _initializeRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: AppRoute.login.path,
          builder: (context, state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: AppRoute.register.path,
          builder: (context, state) {
            return const RegisterScreen();
          },
        ),
        GoRoute(
          path: AppRoute.otp.path,
          builder: (context, state) {
            return const OtpScreen();
          },
        ),
        GoRoute(
          path: AppRoute.home.path,
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: AppRoute.root.path,
          builder: (context, state) {
            return _buildInitialScreen();
          },
        ),
      ],
    );
  }

  Widget _buildInitialScreen() {
    // Check if the user is authenticated and return the appropriate screen
    if (isUserAuthenticated) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}

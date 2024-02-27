import 'package:estate_flutter_app/product/ui/screen/auth/login/view/login_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/register/view/register_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/home/view/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  GoRouter goRoutes = GoRouter(routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),
  ]);
}

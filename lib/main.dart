import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/login/view/login_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://naaxttotwtwqixafyjyk.supabase.co",
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5hYXh0dG90d3R3cWl4YWZ5anlrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1NTc1NjQsImV4cCI6MjAyNDEzMzU2NH0.CkBmQy1q0KXkBIztnVvM5Rlxq4I7_Z9DkR8sEMGEslc',
  );

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  final currentUser = Supabase.instance.client.auth.currentUser;

  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: currentUserControl(),
      ),
    );
  }

  Widget currentUserControl() {
    if (currentUser == null) {
      print(' kullanıcı $currentUser');
      return const LoginScreen();
    } else {
      print(' kullanıcı $currentUser');
      return const HomeScreen();
    }
  }
}

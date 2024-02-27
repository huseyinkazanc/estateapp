import 'package:estate_flutter_app/feature/constant/color/estate_color.dart';
import 'package:estate_flutter_app/feature/service/app_service.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/login/view/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EstateColor estateColor = EstateColor();
  AppService appService = AppService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  appService.logoutUser();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Text("çıkış yap")),
          )
        ],
      ),
    );
  }
}

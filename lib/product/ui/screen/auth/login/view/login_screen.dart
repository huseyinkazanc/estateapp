import 'package:estate_flutter_app/feature/constant/color/estate_color.dart';
import 'package:estate_flutter_app/feature/constant/font/estate_font.dart';
import 'package:estate_flutter_app/feature/constant/string/estate_string.dart';
import 'package:estate_flutter_app/feature/extension/widget_extension.dart';
import 'package:estate_flutter_app/feature/core/service/app_service.dart';
import 'package:estate_flutter_app/feature/widget/estate_button.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/register/view/register_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/widget/auth_icon_button.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/widget/auth_textfield.dart';
import 'package:estate_flutter_app/product/ui/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = true;

  final AppService appService = AppService();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    EstateString.loginTitleOneText,
                    style: TextStyle(fontSize: EstateFont.fontSizeTwentyFour),
                  ),
                  Text(
                    EstateString.loginTitleOneText_,
                    style: TextStyle(color: EstateColor.stringColor, fontSize: EstateFont.fontSizeTwentyFour),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                EstateString.loginSubTitleTwoText,
              ),
              const SizedBox(
                height: 25,
              ),
              AuthTextField(
                controller: emailController,
                hintText: EstateString.loginHintEmailText,
                prefixIcon: Icons.person_outlined,
              ).paddingOnly(bottom: 8),
              AuthTextField(
                obsecureText: showPassword,
                controller: passwordController,
                hintText: EstateString.loginHintPasswordText,
                prefixIcon: Icons.email_outlined,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Parolanız en az 6 karakter olmalı.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(EstateString.loginForgotPasswordText),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: const Text(EstateString.authShowPasswordText))
                ],
              ).paddingOnly(bottom: 8),
              const SizedBox(height: 20),
              EstateButton(
                onPressed: () async {
                  await appService.loginUser(
                      emailController.text, passwordController.text, context, const HomeScreen());
                },
                text: EstateString.authLoginText,
              ).paddingOnly(bottom: 8),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 15,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text(EstateString.loginOr),
                  Expanded(
                    child: Divider(
                      indent: 15,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AutoIconButton(
                      onPressed: () {},
                      iconData: Icons.facebook,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AutoIconButton(
                      onPressed: () {},
                      iconData: Icons.facebook,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(EstateString.loginDontHaveAcText),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                    child: const Text(EstateString.registerButtonText),
                  ),
                ],
              ).paddingOnly(bottom: 8)
            ],
          ),
        ),
      ),
    );
  }
}

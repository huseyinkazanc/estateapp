import 'package:estate_flutter_app/feature/constant/string/estate_string.dart';
import 'package:estate_flutter_app/feature/extension/widget_extension.dart';
import 'package:estate_flutter_app/feature/core/service/app_service.dart';
import 'package:estate_flutter_app/feature/widget/estate_button.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/login/view/login_screen.dart';
import 'package:estate_flutter_app/product/ui/screen/auth/widget/auth_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final AppService appService = AppService();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(EstateString.loginTitleOneText).paddingOnly(bottom: 8),
              const Text(EstateString.loginSubTitleTwoText).paddingOnly(bottom: 8),
              AuthTextField(
                      controller: nameController,
                      hintText: EstateString.registerHintNameText,
                      prefixIcon: Icons.person_2_outlined)
                  .paddingOnly(bottom: 8),
              AuthTextField(
                      controller: surnameController,
                      hintText: EstateString.registerHintSurameText,
                      prefixIcon: Icons.person_2_outlined)
                  .paddingOnly(bottom: 8),
              AuthTextField(
                      controller: emailController,
                      hintText: EstateString.registerHintEmailText,
                      prefixIcon: Icons.email_outlined)
                  .paddingOnly(bottom: 8),
              AuthTextField(
                obsecureText: showPassword,
                controller: passwordController,
                hintText: EstateString.registerHintPasswordText,
                prefixIcon: Icons.lock_outline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "boş olamaz";
                  }
                  return null;
                },
              ).paddingOnly(bottom: 8),
              AuthTextField(
                      obsecureText: showPassword,
                      controller: confirmPasswordController,
                      hintText: EstateString.registerHintConfirmPasswordText,
                      prefixIcon: Icons.lock_outline)
                  .paddingOnly(bottom: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(EstateString.registerTermsOfText),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: const Text(EstateString.authShowPasswordText))
                ],
              ).paddingOnly(bottom: 8),
              EstateButton(
                onPressed: () async {
                  await appService.registerUserAndSaveToSupabase(
                      nameController.text, surnameController.text, emailController.text, passwordController.text);
                },
                text: EstateString.registerButtonText,
              ).paddingOnly(bottom: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(EstateString.registerAlreadyAcText),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: const Text(EstateString.authLoginText),
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

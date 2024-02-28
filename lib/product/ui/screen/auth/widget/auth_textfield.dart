import 'package:estate_flutter_app/feature/resource/estate_text_styles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool? obsecureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  const AuthTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.controller,
      this.obsecureText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ?? false,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      style: EstateTextStyles.regular.copyWith(
        letterSpacing: 0.75,
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}

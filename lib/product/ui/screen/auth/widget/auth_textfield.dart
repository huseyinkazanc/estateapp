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
    return SizedBox(
      height: 59,
      child: TextFormField(
        obscureText: obsecureText ?? false,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
        ),
      ),
    );
  }
}

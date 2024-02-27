import 'package:estate_flutter_app/feature/constant/color/estate_color.dart';
import 'package:flutter/material.dart';

class EstateButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final String text;

  EstateButton({super.key, this.backgroundColor, this.foregroundColor, required this.onPressed, required this.text});

  final EstateColor estateColor = EstateColor();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? estateColor.mainButtonColor,
          foregroundColor: foregroundColor ?? estateColor.mainWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

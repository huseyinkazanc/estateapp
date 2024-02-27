import 'package:flutter/material.dart';

class AutoIconButton extends StatelessWidget {
  const AutoIconButton({super.key, required this.onPressed, required this.iconData});
  final VoidCallback onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Icon(iconData),
      ),
    );
  }
}

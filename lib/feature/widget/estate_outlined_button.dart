import 'package:estate_flutter_app/feature/constant/color/estate_color.dart';
import 'package:flutter/material.dart';

class EstateOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? iconData;

  const EstateOutlinedButton({Key? key, required this.onPressed, required this.text, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: EstateColor().mainWhiteColor,
            foregroundColor: EstateColor().mainBlackColor,
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(iconData),
          Text(text),
        ]));
  }
}

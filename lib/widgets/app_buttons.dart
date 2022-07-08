import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool isIcon;

  AppButtons(
      {Key? key,
      this.isIcon = true,
      this.icon,
      this.text,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: isIcon
            ? Icon(icon)
            : AppText(
                text: text!,
                color: color,
              ),
      ),
    );
  }
}

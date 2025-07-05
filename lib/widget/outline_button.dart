import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GMGNOutlineButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final void Function() onPressed;
  final String text;
  final double? fontSize;
  const GMGNOutlineButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    required this.onPressed,
    required this.text,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    final bdColor = borderColor ?? Colors.grey.shade300;
    final bgColor = backgroundColor ?? Get.theme.primaryColor;
    final pressedColor = bgColor.withValues(alpha: 0.1);
    final tColor = textColor ?? Colors.black87;
    final pressedTextColor = tColor.withValues(alpha: 0.2);
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith((states) {
          Color borderColor;
          if (states.contains(WidgetState.pressed)) {
            borderColor = bdColor.withValues(alpha: 0.25);
          } else {
            borderColor = bdColor;
          }
          return BorderSide(color: borderColor, width: 1);
        }),
        overlayColor: WidgetStateProperty.all(pressedColor),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return pressedTextColor;
          }
          return tColor;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return pressedColor;
          }
          return bgColor;
        }),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize ?? 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

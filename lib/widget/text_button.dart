import 'package:flutter/material.dart';

class GMGNTextButton extends StatelessWidget {
  final void Function() onPressed;
  final Color pressedColor;
  final Color lightColor;
  final String text;
  const GMGNTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.pressedColor,
    required this.lightColor,
  });
  @override
  Widget build(BuildContext context) {
    final colorProperty = WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return pressedColor;
      }
      return lightColor;
    });
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: colorProperty,
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}

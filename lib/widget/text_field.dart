import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GMGNTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? textInputType;
  const GMGNTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.formatters,
    this.suffixIcon,
    this.obscureText,
    this.textInputType,
  });
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 48),
      child: TextField(
        controller: controller,
        obscureText: obscureText == null ? false : obscureText!,
        cursorColor: Color(0xffBDF100),
        cursorWidth: 2,
        inputFormatters: formatters,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Color(0xffF8F9FB),
          filled: true,
          hintStyle: TextStyle(color: Colors.blueGrey.shade200, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          suffixIcon: suffixIcon,
          // contentPadding: EdgeInsets.zero,
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}

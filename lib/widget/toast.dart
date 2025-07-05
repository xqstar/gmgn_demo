import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showToast(BuildContext context, {required String msg}) {
  Get.showSnackbar(
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.grey.shade300,
      maxWidth: View.of(context).physicalSize.width * 0.5,
      animationDuration: Duration(milliseconds: 250),
      duration: Duration(seconds: 3),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      borderRadius: 4,
      margin: EdgeInsets.only(top: 80, left: 64, right: 64),
      messageText: Center(
        child: Text(
          msg,
          style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

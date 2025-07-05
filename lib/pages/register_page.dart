import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmgn/model/models.dart';
import 'package:gmgn/router/router.dart';
import 'package:gmgn/utils/app_utils.dart';
import 'package:gmgn/widget/text_field.dart';
import 'package:gmgn/widget/toast.dart';

class RegisterPage extends StatelessWidget {
  final controller = Get.put<RegisterController>(RegisterController());
  @override
  Widget build(BuildContext context) {
    final disableColor = Get.theme.disabledColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 88),
                // Title
                Text(
                  'Sign up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black87),
                ),

                SizedBox(height: 40),
                // Email input field
                GMGNTextField(hintText: 'Enter email', controller: controller.emailController),
                SizedBox(height: 20),
                // Next button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ObxValue((submitState) {
                    Color bgColor;
                    Color textColor;
                    Widget? loadingIcon;
                    switch (submitState.value) {
                      case LoginOrRegisterState.disable:
                        bgColor = disableColor;
                        textColor = Colors.black26;
                        break;
                      case LoginOrRegisterState.enable:
                        bgColor = Get.theme.primaryColor;
                        textColor = Colors.black87;
                        break;
                      case LoginOrRegisterState.loading:
                        bgColor = Get.theme.primaryColor;
                        textColor = Colors.black87;
                        loadingIcon = SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.black26,
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.grey.shade300),
                          ),
                        );
                        break;
                    }

                    return TextButton.icon(
                      onPressed: () {
                        controller.submitEmail(() {
                          showToast(context, msg: 'Please input valid email address');
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: bgColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      icon: loadingIcon,
                      label: Text(
                        'Next',
                        style: TextStyle(fontSize: 15, color: textColor, fontWeight: FontWeight.w600),
                      ),
                    );
                  }, controller.registerState),
                ),

                SizedBox(height: 16),
                // Forgot password and Register row
                Center(
                  child: InkWell(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    onTap: () {
                      controller.pressedState.value = true;
                      Get.toNamed(Routers.login);
                    },
                    onLongPress: () {
                      controller.pressedState.value = true;
                    },
                    onTapCancel: () {
                      controller.pressedState.value = false;
                    },

                    child: ObxValue((pressedState) {
                      Color preColor;
                      Color endColor;
                      if (!pressedState.value) {
                        preColor = Colors.black54;
                        endColor = Get.theme.primaryColor;
                      } else {
                        preColor = Colors.black54.withValues(alpha: 0.15);
                        endColor = Get.theme.primaryColor.withValues(alpha: 0.3);
                      }
                      return Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(color: preColor, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: ' Go to Login',
                              style: TextStyle(color: endColor, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    }, controller.pressedState),
                  ),
                ),

                SizedBox(height: 50),
                // OR divider
                Row(
                  children: [
                    Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('OR', style: TextStyle(color: Colors.grey.shade400, fontSize: 15)),
                    ),
                    Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
                  ],
                ),
                SizedBox(height: 20),
                // Connect Telegram button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton.icon(
                    onPressed: () => launchTelegram(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.grey.shade400;
                        }
                        return Colors.black;
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.grey.shade500;
                        }
                        return Colors.white;
                      }),
                      iconColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.blueAccent.shade400.withValues(alpha: 0.3);
                        }
                        return Colors.blueAccent.shade400;
                      }),
                      overlayColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.grey.shade400;
                        }
                        return null;
                      }),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                    icon: Icon(Icons.telegram_rounded, size: 24),
                    label: Text('Connect Telegram', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final registerState = LoginOrRegisterState.disable.obs;
  final pressedState = false.obs;
  void submitEmail(void Function() onEmailError) {
    if (!GetUtils.isEmail(emailController.text)) {
      onEmailError();
      return;
    } else {
      registerState.value = LoginOrRegisterState.loading;

      // service.login(LoginParams(email: emailController.text, password: passwordController.text)).then((login) {
      //   if (login) {
      //     Get.back();
      //   }
      // });
    }
  }
}

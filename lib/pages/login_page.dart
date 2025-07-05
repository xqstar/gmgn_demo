import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmgn/model/models.dart';
import 'package:gmgn/router/router.dart';
import 'package:gmgn/service/app_service.dart';
import 'package:gmgn/utils/app_utils.dart';
import 'package:gmgn/widget/text_button.dart';
import 'package:gmgn/widget/text_field.dart';
import 'package:gmgn/widget/toast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // final disableColor = Color(0xffF2F4F7);
  final controller = Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    final disableColor = Get.theme.disabledColor;
    final primaryColor = Colors.limeAccent.shade700;
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
                SizedBox(height: 90),
                // Title
                Text(
                  'Log in',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black87),
                ),

                SizedBox(height: 16),
                // Email input field
                GMGNTextField(hintText: 'Enter email', controller: controller.emailController),
                SizedBox(height: 20),
                ObxValue((showPasswordState) {
                  final iconUrl = showPasswordState.value
                      ? 'assets/icon/icon_show_psd.png'
                      : 'assets/icon/icon_hide_psd.png';

                  return GMGNTextField(
                    hintText: 'Enter password',
                    controller: controller.passwordController,
                    textInputType: TextInputType.text,
                    obscureText: !showPasswordState.value,
                    suffixIcon: IconButton(
                      onPressed: controller.showPsdOrNot,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        child: Image.asset(
                          key: ValueKey(iconUrl),
                          iconUrl,
                          color: Colors.black87,
                          width: 16,
                          height: 16,
                        ),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    ),
                  );

                  // return Icon(
                  //   showPasswordState.value ? Icons.remove_red_eye_outlined : Icons.close,
                  //   color: Colors.black87,
                  // );
                }, controller.showPasswordState),

                SizedBox(height: 20),
                // Next button
                SizedBox(
                  width: double.infinity,
                  height: 44,
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
                        bgColor = disableColor;
                        textColor = Colors.black26;
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
                        style: TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w600),
                      ),
                    );
                  }, controller.loginSubmitState),
                ),

                SizedBox(height: 8),
                // Forgot password and Register row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text('Forgot password?', style: TextStyle(color: Colors.grey.shade200, fontSize: 15)),
                    ),
                    GMGNTextButton(
                      onPressed: () {
                        Get.toNamed(Routers.register);
                      },
                      text: 'Register now',
                      pressedColor: primaryColor.withValues(alpha: 0.3),
                      lightColor: primaryColor,
                    ),
                  ],
                ),

                SizedBox(height: 50),
                // OR divider
                Row(
                  children: [
                    Expanded(child: Container(height: 1, color: Colors.grey[300])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('OR', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                    ),
                    Expanded(child: Container(height: 1, color: Colors.grey[300])),
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
                          return Colors.white24;
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

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final service = Get.find<AppService>();
  bool emailEnable = false;
  bool passwordEnable = false;
  final loginSubmitState = LoginOrRegisterState.disable.obs;
  final showPasswordState = false.obs;

  bool get canSubmit => emailEnable && passwordEnable;

  bool get onLoading => loginSubmitState.value == LoginOrRegisterState.loading;
  final goRegisterState = false.obs;
  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (onLoading) {
        return;
      }
      emailEnable = emailController.text.length >= 7;
      loginSubmitState.value = canSubmit ? LoginOrRegisterState.enable : LoginOrRegisterState.disable;
    });
    passwordController.addListener(() {
      if (onLoading) {
        return;
      }
      passwordEnable = passwordController.text.length >= 2;
      loginSubmitState.value = canSubmit ? LoginOrRegisterState.enable : LoginOrRegisterState.disable;
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void submitEmail(void Function() onEmailError) {
    if (!GetUtils.isEmail(emailController.text)) {
      onEmailError();
      return;
    } else {
      loginSubmitState.value = LoginOrRegisterState.loading;
      service.login(LoginParams(email: emailController.text, password: passwordController.text)).then((login) {
        if (login) {
          Get.back();
        }
      });
    }
  }

  void showPsdOrNot() {
    showPasswordState.value = !showPasswordState.value;
  }
}

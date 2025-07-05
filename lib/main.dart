import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:gmgn/router/router.dart';
import 'package:gmgn/service/app_service.dart';

void main() {
  Get.put(AppService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemStatusBarContrastEnforced: true, statusBarColor: Colors.transparent),
    );
    return GetMaterialApp(
      title: 'Trading App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        primarySwatch: Colors.green,
        primaryColor: Color(0xffBDF100),
        disabledColor: Color(0xffF2F4F7),
        fontFamily: 'SF Pro Display',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: Routers.getPages,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
    );
  }
}

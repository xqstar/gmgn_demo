import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gmgn/model/models.dart';

class AppService extends GetxService {
  Future<bool> login(LoginParams params) async {
    return Future.delayed(Duration(seconds: 2)).then(
      (_) => request('assets/mock/login.json').then((data) {
        return LoginResponse.fromJson(data).data;
      }),
    );
  }

  Future<dynamic> request(String path) async {
    return rootBundle.loadString(path).then((data) => json.decode(data));
  }
}

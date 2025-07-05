import 'package:get/get.dart';
import 'package:gmgn/pages/assets_page.dart';
import 'package:gmgn/pages/copy_trade.dart';
import 'package:gmgn/pages/login_page.dart';
import 'package:gmgn/pages/register_page.dart';
import 'package:gmgn/pages/trading_page.dart';
import 'package:gmgn/pages/web_page.dart';

class Routers {
  static const main = '/';
  static const login = '/login';
  static const web = '/web';
  static const register = '/register';
  static const assets = '/assets';
  static const copyTrade = '/copy/trade';
  static final List<GetPage> _getPages = [
    GetPage(name: main, page: () => TradingPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: web, page: () => WebPage()),
    GetPage(name: register, page: () => RegisterPage(), transition: Transition.noTransition),
    GetPage(name: copyTrade, page: () => CopyTradePage(), transition: Transition.noTransition),
  ];

  static List<GetPage> get getPages => _getPages;
}

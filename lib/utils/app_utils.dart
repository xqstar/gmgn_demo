import 'package:get/get.dart';
import 'package:gmgn/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchTelegram() async {
  final telegramUrl = Uri.parse('tg://');
  return canLaunchUrl(telegramUrl).then((installed) {
    if (installed) {
      launchUrl(Uri.parse('tg://open'));
    } else {
      Get.toNamed(Routers.web, parameters: {'url': 'https://web.telegram.org'});
    }
  });
}

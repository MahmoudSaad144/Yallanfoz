import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';

class AppInfoController extends GetxController {
  final RxMap<String, dynamic> appInfo = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> contactus = <String, dynamic>{}.obs;
  final List<Map<String, dynamic>> socialIcons = [
    {
      'key': 'facebook',
      'label': 'Facebook',
      'icon': FontAwesomeIcons.facebook,
      'color': Color(0xFF3b5998),
    },
    {
      'key': 'twitter',
      'label': 'Twitter',
      'icon': FontAwesomeIcons.twitter,
      'color': Color(0xFF00acee),
    },
    {
      'key': 'youtube',
      'label': 'YouTube',
      'icon': FontAwesomeIcons.youtube,
      'color': Color(0xFFFF0000),
    },
    {
      'key': 'snapchat',
      'label': 'Snapchat',
      'icon': FontAwesomeIcons.snapchat,
      'color': Color.fromARGB(255, 211, 208, 22),
    },
    {
      'key': 'instgram',
      'label': 'Instagram',
      'icon': FontAwesomeIcons.instagram,
      'color': Color(0xFFE1306C),
    },
    {
      'key': 'tiktok',
      'label': 'TikTok',
      'icon': FontAwesomeIcons.tiktok,
      'color': Color(0xFF000000),
    },
    {
      'label': 'WhatsApp',
      'icon': FontAwesomeIcons.whatsapp,
      'color': Colors.green,
      'urlKey': 'phone', // هنستخدمه لبناء رابط واتساب
      'isWhatsapp': true,
    },
    {
      'label': 'Google Maps',
      'icon': FontAwesomeIcons.locationDot,
      'color': Colors.deepOrange,
      'urlKey': 'address', // أو خريطة لو حابب
      'isMap': true,
    },
  ];

  Future<void> getAppInfo() async {
    final response = await ApiService.getRequest(
      "$serverlink/api/appinfo",
      null,
    );
    if (response != null) {
      appInfo.value = response['appinfo'];
      contactus.value = response['contactus'];
    }
  }

  Future<void> launchUniversalLink(String url, String fallbackUrl) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        final fallbackUri = Uri.parse(fallbackUrl);
        if (await canLaunchUrl(fallbackUri)) {
          await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
        } else {
          Get.snackbar(
            'خطأ',
            ' سوف نتواجد هنا قريبا ',
            backgroundColor: Colors.deepOrange,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء محاولة الفتح');
    }
  }
}

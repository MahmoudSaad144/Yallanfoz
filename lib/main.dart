import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // استورد GetX
import 'package:yallanfoz/auth/forgetpassword.dart';
import 'package:yallanfoz/auth/login.dart';
import 'package:yallanfoz/auth/register.dart';
import 'package:yallanfoz/home.dart';
import 'package:yallanfoz/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  // إخفاء الشريطين (status bar + navigation bar)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // منع تأثر الخط بإعدادات الجهاز
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        );
      },

      home: Splash(),

      // Define routes using GetX
      getPages: [
        GetPage(name: "/splash", page: () => Splash()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/register", page: () => Signup()),
        GetPage(name: "/forgetpassword", page: () => Forgetpassword()),
        GetPage(name: "/home", page: () => Home()),
      ],
      // Get.toNamed("/home"); // للذهاب إلى صفحة مع الاحتفاظ بالباقي اسفله
      // Get.offNamed("/login"); // للذهاب مع إزالة الصفحة الحالية
      //Get.offAllNamed(/home); // يحذف كل الصفحات اللي في الـ stack ويروح للصفحة الجديدة
      // Get.back(); // للرجوع للخلف
    );
  }
}

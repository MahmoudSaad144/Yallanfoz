import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // استورد GetX
import 'package:permission_handler/permission_handler.dart';
import 'package:yallanfoz/auth/forgetpassword.dart';
import 'package:yallanfoz/auth/login.dart';
import 'package:yallanfoz/auth/register.dart';
import 'package:yallanfoz/home.dart';
import 'package:yallanfoz/pages/answer.dart';
import 'package:yallanfoz/pages/gamepage.dart';
import 'package:yallanfoz/pages/games.dart';
import 'package:yallanfoz/pages/mygames.dart';
import 'package:yallanfoz/pages/packages.dart';
import 'package:yallanfoz/pages/profile.dart';
import 'package:yallanfoz/pages/question.dart';
import 'package:yallanfoz/pages/settings.dart';
import 'package:yallanfoz/pages/whoanswer.dart';
import 'package:yallanfoz/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ده مهم جدًا
  await MainRequestBeforeStartApp();
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
        GetPage(name: "/profile", page: () => Profile()),
        GetPage(name: "/packages", page: () => Packages()),
        GetPage(name: "/settingpage", page: () => Setting()),
        GetPage(name: "/games", page: () => Games()),
        GetPage(name: "/mygames", page: () => Mygames()),
        GetPage(name: "/gamepage", page: () => Gamepage()),
        GetPage(name: "/question", page: () => Questionpage()),
        GetPage(name: "/answer", page: () => Answerpage()),
        GetPage(name: "/whoanswer", page: () => WhoAnswerpage()),
      ],
      // Get.toNamed("/home"); // للذهاب إلى صفحة مع الاحتفاظ بالباقي اسفله
      // Get.offNamed("/login"); // للذهاب مع إزالة الصفحة الحالية
      //Get.offAllNamed(/home); // يحذف كل الصفحات اللي في الـ stack ويروح للصفحة الجديدة
      // Get.back(); // للرجوع للخلف
    );
  }
}

Future<void> MainRequestBeforeStartApp() async {
  // تثبيت وضع الشاشة
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  // طلب الأذونات أول مرة فقط

  PermissionStatus cameraStatus = await Permission.camera.request();

  if (cameraStatus.isGranted) {
    print("كل الأذونات اتوافق عليها ✅");
  } else {
    print("فيه إذن مرفوض ❌");
  }
  // إخفاء شريط الحالة
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

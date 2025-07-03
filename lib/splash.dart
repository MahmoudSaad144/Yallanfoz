import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/controller/appinfo_controller.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double opacity1 = 0;
  double opacity2 = 0;
  double opacity3 = 0;
  double opacity4 = 0;
  double space = 0;
  double bottomPadding = 0; // للتحكم في حركة الجملة للأعلى
  final userController = Get.find<UserController>();
  final appinfocontroller = Get.find<AppInfoController>();
  @override
  void initState() {
    super.initState();

    // التأثيرات الخاصة
    Timer(const Duration(milliseconds: 500), () {
      setState(() => opacity1 = 1);
    });
    Timer(const Duration(milliseconds: 1000), () {
      setState(() => opacity2 = 1);
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() => space = 20);
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        opacity3 = 1;
        bottomPadding = 20; // تحريك الجملة للأعلى بشكل ناعم
      });
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() => opacity4 = 1);
    });

    // بعد 6 ثواني، تحقق من حالة تسجيل الدخول
    Timer(const Duration(seconds: 6), () async {
      String? token = GetStorage().read('token');
      if (token != null) {
        await userController.getUser();
        Get.offAllNamed("/home");
      } else {
        Get.offAllNamed("/login");
      }
      await appinfocontroller.getAppInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xFFF4A300)),
        child: Stack(
          children: [
            // الخلفية المتدرجة
            Container(decoration: BoxDecoration(color: Colors.black)),

            // المحتوى الرئيسي في المنتصف
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity1,
                          child: FittedBox(
                            child: Text(
                              "يلا",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontFamily: "Cairo",
                                color: Color(0xFFFFECB3),
                              ),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity2,
                          child: SizedBox(width: space),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity3,
                          child: Image.asset(
                            "images/logo.png",
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity2,
                          child: SizedBox(width: space),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity2,
                          child: FittedBox(
                            child: Text(
                              "نفوز",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontFamily: "Cairo",
                                color: Color(0xFFFFECB3),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // الجملة أسفل الشاشة بتأثير جمالي
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 4),
                opacity: opacity4,
                child: AnimatedPadding(
                  duration: const Duration(seconds: 3),
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: Center(
                    child: Text(
                      "الوقت ما يحلى الا معاها …",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Cairo",
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

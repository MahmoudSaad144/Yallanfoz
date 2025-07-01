import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/mygames_controller.dart';

// Show GameStartDialog Info

void ShowDialogGameInfo(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      final Width = MediaQuery.of(context).size.width;
      final Height = MediaQuery.of(context).size.height;

      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 0,
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: Width * 0.4,
            maxHeight: Height * 0.4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الصف اللي فيه زر الإغلاق
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // أيقونة X للإغلاق
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close, color: Colors.grey),
                  ),
                ],
              ),

              // إيقونة التحذير
              Icon(
                Icons.warning_amber_rounded,
                size: Width * 0.07,
                color: const Color(0xFFff9a9e),
              ),
              SizedBox(height: 12),
              // النص داخل سكرول لو طويل
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text("إلغاء"),
            ),
          ),
        ],
      );
    },
  );
}

ShowDialogMyGame(BuildContext context, selected, MyGamesController controller) {
  double Width = MediaQuery.of(context).size.width;
  double Height = MediaQuery.of(context).size.height;
  return AnimatedPadding(
    padding: EdgeInsets.only(bottom: 0),
    duration: Duration(milliseconds: 200),
    child: AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: Width * 0.4,
          maxHeight: Height * 0.4,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الصف اللي فيه زر الإغلاق
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  // النص في النص
                  Text(
                    " المتابعة من حيث توقفت ",
                    style: TextStyle(
                      fontSize: Width * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Spacer عشان النص يفضل في النص
                  Spacer(),
                  // زر الإغلاق في أقصى الشمال
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close, color: Colors.grey),
                  ),

                  // Spacer يفصل الإكس عن النص
                ],
              ),

              SizedBox(height: 40),

              // النص داخل سكرول لو طويل
              Text(
                " لديك لعبة نشطة، هل تريد متابعة اللعب أو الاعادة ؟ ",
                style: TextStyle(fontSize: Width * 0.02),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
          width: Width * 0.2,
          height: Height * 0.12,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              print(selected);
              //هنطلب api الاول الخاص بحلب اللعبه
              controller.gamepagecontroller.mygame.value = selected;
              Get.offNamedUntil(
                '/gamepage',
                (route) => route.settings.name == '/home',
              );
            },
            child: Text("الاستمرار", style: TextStyle(color: Colors.black)),
          ),
        ),
        Container(
          width: Width * 0.2,
          height: Height * 0.12,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            onPressed: () {
              Get.dialog(
                MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(viewInsets: EdgeInsets.zero),
                  child: GameStartDialog(create: false, controller: controller),
                ),
              );
            },
            child: Text(
              " البدء من جديد",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

// Show GameStartDialog

class GameStartDialog extends StatelessWidget {
  final bool? create;
  final dynamic controller;

  const GameStartDialog({
    super.key,
    required this.create,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: 0),
      duration: Duration(milliseconds: 200),
      child: Transform.translate(
        offset: Offset(0, -40),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 0,
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: Width * 0.7,
              minHeight: Height * 0.5,
            ),
            child: Form(
              key: controller.startGame,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // الصف اللي فيه زر الإغلاق
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        // النص في النص
                        Text(
                          " حدد معلومات الفرف ",
                          style: TextStyle(
                            fontSize: Width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    if (create == true) ...[
                      Container(
                        width: Width * 0.3,
                        child: TextFormField(
                          controller: controller.teamname,
                          validator: (teamname) {
                            if (teamname!.isEmpty) {
                              return " هذا الحقل مطلوب ";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: " اسم اللعبة",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 208, 114, 151),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 208, 114, 151),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                    // النص داخل سكرول لو طويل
                    Wrap(
                      spacing: 50,
                      runSpacing: 8.0,
                      children: [
                        Container(
                          width: Width * 0.3,
                          child: TextFormField(
                            controller: controller.firstTeam,
                            validator: (firstTeam) {
                              if (firstTeam!.isEmpty) {
                                return " هذا الحقل مطلوب ";
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUnfocus,

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: " اسم الفريق الأول  ",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    208,
                                    114,
                                    151,
                                  ), // لون البوردر العادي
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(
                                    255,
                                    208,
                                    114,
                                    151,
                                  ), // لون البوردر وقت الفوكس
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: Width * 0.3,
                          child: TextFormField(
                            controller: controller.secondTeam,
                            validator: (secondTeam) {
                              if (secondTeam!.isEmpty) {
                                return " هذا الحقل مطلوب ";
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUnfocus,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: " اسم الفريق الثاني  ",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    208,
                                    114,
                                    151,
                                  ), // لون البوردر العادي
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(
                                    255,
                                    208,
                                    114,
                                    151,
                                  ), // لون البوردر وقت الفوكس
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            Container(
              width: Width * 0.3,
              height: Height * 0.12,
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: () async {
                    await controller.StartGame();
                  },
                  child:
                      controller.loading.value
                          ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          )
                          : Text(
                            "ابدأ اللعبة",
                            style: TextStyle(color: Colors.white),
                          ),
                ),
              ),
            ),
            Container(
              width: Width * 0.3,
              height: Height * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Get.back(),
                child: Text("إلغاء", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Phone Helper
class HelperPhoneDialog extends StatefulWidget {
  final String helperteam;

  const HelperPhoneDialog({super.key, required this.helperteam});
  @override
  State<HelperPhoneDialog> createState() => _HelperPhoneDialogState();
}

class _HelperPhoneDialogState extends State<HelperPhoneDialog> {
  bool timestart = false;
  int _secondsLeft = 60;
  Timer? _countdownTimer;

  void _startCountdown() {
    print(widget.helperteam);
    setState(() {
      timestart = true;
      _secondsLeft = 60;
    });
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsLeft--;
        if (_secondsLeft <= 0) {
          timer.cancel();
          Get.back(); // يرجع الشاشة تلقائياً
        }
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: 0),
      duration: Duration(milliseconds: 200),
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.grey[400],
        contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Width * 0.4,
            minHeight: Height * 0.6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      // النص في النص
                      Text(
                        " اتصل بصديق ",
                        style: TextStyle(
                          fontSize: Width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      if (!timestart)
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: Colors.grey),
                        ),
                    ],
                  ),
                ),
              ),
              // هنا نستخدم شرط
              if (!timestart) ...[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      " صديقك اللي يعرف كل شي هذا وقته، دق عليه ",
                      style: TextStyle(fontSize: Width * 0.025),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Icon(Icons.phone, color: Colors.green, size: Width * 0.05),
              ] else ...[
                // عرض العدّاد
                Expanded(
                  child: Text(
                    " عندك دقيقة وحدة تقدر تتصل فيها على شخص ممكن يكون عارف الإجابة ",
                    style: TextStyle(fontSize: Width * 0.025),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),

                Expanded(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // الدائرة المتقلصة
                        Container(
                          width: Width * 0.15,
                          height: Width * 0.15,
                          child: CircularProgressIndicator(
                            value: _secondsLeft / 60,
                            strokeWidth: 5,
                          ),
                        ),
                        // الرقم اللي في الوسط
                        Text(
                          "${_secondsLeft}s",
                          style: TextStyle(
                            fontSize: Width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              SizedBox(height: 50),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          if (!timestart) ...[
            Container(
              width: Width * 0.2,
              height: Height * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {
                  setState(() {
                    _startCountdown();
                  });
                },
                child: Text("ابدأ ", style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: Width * 0.2,
              height: Height * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Get.back(),
                child: Text("إلغاء", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

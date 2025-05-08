import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

// Show GameStartDialog

class GameStartDialog extends StatefulWidget {
  final List<String> ids;

  const GameStartDialog({super.key, required this.ids});
  @override
  State<GameStartDialog> createState() => _GameStartDialogState();
}

class _GameStartDialogState extends State<GameStartDialog> {
  GlobalKey<FormState> startGame = GlobalKey();
  TextEditingController firstTeam = TextEditingController();
  TextEditingController secondTeam = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    firstTeam.dispose();
    secondTeam.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: 0),
      duration: Duration(milliseconds: 200),
      child: Transform.translate(
        offset: Offset(0, -50),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
              key: startGame,
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

                    SizedBox(height: 12),

                    // النص داخل سكرول لو طويل
                    Wrap(
                      spacing: 50,
                      runSpacing: 8.0,
                      children: [
                        Container(
                          width: Width * 0.3,
                          child: Column(
                            children: [
                              Text(
                                " الفريق الأول ",
                                style: TextStyle(
                                  fontSize: Width * 0.025,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: firstTeam,
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
                                      color: const Color(
                                        0xFFFFD700,
                                      ), // لون البوردر العادي
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0xFFFFA500,
                                      ), // لون البوردر وقت الفوكس
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: Width * 0.3,
                          child: Column(
                            children: [
                              Text(
                                " الفريق الثاني ",
                                style: TextStyle(
                                  fontSize: Width * 0.025,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: secondTeam,
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
                                      color: const Color(
                                        0xFFFFD700,
                                      ), // لون البوردر العادي
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                        0xFFFFA500,
                                      ), // لون البوردر وقت الفوكس
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () async {
                  if (startGame.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    print(
                      "${widget.ids}  ${firstTeam.text}  ${secondTeam.text} $isLoading",
                    );
                    await Future.delayed(
                      Duration(seconds: 3),
                    ); // بدل دي هيكون دالة تسجيل البيانات في ال api
                    setState(() {
                      isLoading = false;
                    });
                    print(isLoading);
                    Get.offNamed(
                      "/home",
                      arguments: widget.ids,
                    ); // هيكون بدل دي صفحه اللعبه مع تمرير ليها ال ids
                  }
                },
                child:
                    isLoading
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

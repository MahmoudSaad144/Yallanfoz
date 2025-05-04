import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => __LoginState();
}

class __LoginState extends State<Login> {
  @override
  void dispose() {
    login_id.dispose();
    password.dispose();
    super.dispose();
  }

  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController login_id = TextEditingController();
  TextEditingController password = TextEditingController();
  bool __isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //MediaQuery.of(context).size.width علشان اجيب عرض الشاشه كامل
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 1, left: 40, right: 40),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E2F),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset("images/logo.png", width: 80, height: 80),
                  Text(
                    "يلا نفوز",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: "Cairo",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: loginform,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: login_id,
                          validator: (login_id) {
                            if (login_id!.isEmpty) {
                              return " هذا الحقل مطلوب ";
                            }
                            return null;
                          },
                          //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "البريد الاكتروني او اسم المتسخدم",
                            labelStyle: TextStyle(color: Colors.white),
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
                        SizedBox(height: 10),

                        TextFormField(
                          controller: password,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return " هذا الحقل مطلوب";
                            }
                            return null;
                          },
                          //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: " كلمة المرور ",
                            labelStyle: TextStyle(color: Colors.white),
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
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed("/forgetpassword");
                              },
                              child: Text(
                                "نسيت كلمة المرور ؟",
                                style: TextStyle(color: Color(0xFFFFECB3)),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  " ليس لديك حساب : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed("/register");
                                  },
                                  child: Text(
                                    "سجل الان ",
                                    style: TextStyle(color: Color(0xFFFFECB3)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (loginform.currentState!.validate()) {
                              __isloading
                                  ? null
                                  : setState(() {
                                    __isloading = true;
                                  });
                              print("vaild ${login_id.text}  ${password.text}");
                            }
                          },
                          color: Color(0xFFF4A300),
                          textColor: Colors.white,
                          minWidth: 200,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child:
                              __isloading
                                  ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : Text(" تسجيل الدخول  "),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

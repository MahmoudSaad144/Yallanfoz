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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color(0xFFff9a9e), const Color(0xFFfad0c4)],
          ),
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
                      fontSize: MediaQuery.of(context).size.width * 0.02,
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "البريد الاكتروني او اسم المتسخدم",
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
                                  0xFFfff5e1,
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
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: " كلمة المرور ",
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
                                  0xFFfff5e1,
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
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  " ليس لديك حساب : ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed("/register");
                                  },
                                  child: Text(
                                    "سجل الان ",
                                    style: TextStyle(color: Colors.deepOrange),
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

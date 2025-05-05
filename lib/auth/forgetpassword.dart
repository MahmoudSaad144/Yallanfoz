import 'package:flutter/material.dart';
import 'package:yallanfoz/components/otp.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => __Forgetpassword();
}

class __Forgetpassword extends State<Forgetpassword> {
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  GlobalKey<FormState> forgetform = GlobalKey();
  TextEditingController email = TextEditingController();
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
                      fontSize: MediaQuery.of(context).size.width * 0.02,
                      fontFamily: "Cairo",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: forgetform,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return " هذا الحقل مطلوب ";
                            }

                            if (!RegExp(
                              r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                            ).hasMatch(email)) {
                              return " البريد الإلكتروني غير صحيح";
                            }

                            return null;
                          },
                          //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "البريد الاكتروني",
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

                        MaterialButton(
                          onPressed: () {
                            if (forgetform.currentState!.validate()) {
                              __isloading
                                  ? null
                                  : setState(() {
                                    __isloading = true;
                                  });
                              print("vaild ${email.text}");
                              _showOtpDialog();
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
                                  : Text(" ارسال "),
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

  void _showOtpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => OtpDialog(
            onCompleted: (code) {
              print(code);
              setState(() {
                __isloading = false;
              });
              // Navigator.of(context).pop(); //هنشيل الكومنت بعد رد من ال api
            },
          ),
    );
  }
}

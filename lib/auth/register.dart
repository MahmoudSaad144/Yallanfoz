import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/country_picker_code.dart';
import 'package:yallanfoz/components/only_country_picker.dart';
import 'package:yallanfoz/components/otp.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String phone_code = "+965";
  String country = "Kuwait";
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
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
                  Image.asset("images/logo.png", width: 60, height: 60),
                  Text(
                    " انشاء حساب جديد ",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: name,
                                validator: (name) {
                                  if (name!.isEmpty) {
                                    return " هذا الحقل مطلوب ";
                                  }
                                  return null;
                                },
                                //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: " الأسم ",
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
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CountryCodePickerField(
                                controller: phone,
                                label: "رقم الهاتف",
                                onCountryCodeChanged: (code) {
                                  setState(() {
                                    phone_code = code;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextFormField(
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
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: "البريد الاكتروني",
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
                            ),
                            SizedBox(width: 10),

                            Expanded(
                              child: CountryOnlyPickerField(
                                label: "الدولة",
                                onCountrySelected: (countryName) {
                                  print(countryName);
                                  setState(() {
                                    country = countryName;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: password,
                                validator: (password) {
                                  if (password!.isEmpty) {
                                    return " هذا الحقل مطلوب ";
                                  }
                                  return null;
                                },
                                //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                obscureText: !isPasswordVisible,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: " كلمة المرور  ",
                                  labelStyle: TextStyle(color: Colors.black),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
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
                            ),
                            SizedBox(width: 10),

                            Expanded(
                              child: TextFormField(
                                controller: confirmpassword,

                                validator: (confirmpassword) {
                                  if (confirmpassword!.isEmpty) {
                                    return " هذا الحقل مطلوب";
                                  }
                                  if (confirmpassword != password.text) {
                                    return " كلمة المرور غير متطابفة";
                                  }
                                  return null;
                                },
                                //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                obscureText: !isConfirmPasswordVisible,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: " تاكيد كلمة المرور ",
                                  labelStyle: TextStyle(color: Colors.black),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isConfirmPasswordVisible =
                                            !isConfirmPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      isConfirmPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
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
                              print(
                                "==========================vaild ${email.text} ${phone_code}${phone.text} ${country}  ${name.text}  ${password.text}  ${confirmpassword.text}",
                              );
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
                                  : Text(" سجل الان "),
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "هل لديك حساب بالفعل : ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAllNamed("/login");
                              },
                              child: Text(
                                " تسجيل الدخول ",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ),
                          ],
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

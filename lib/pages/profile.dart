import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/components/country_picker_code.dart';
import 'package:yallanfoz/components/only_country_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController photo = TextEditingController();
  File? file;
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
  void initState() {
    super.initState();
    name.text = "Mahmoud Saad";
    photo.text = "https://giftdose.dev-swift.com/imgs/users/default-img.png";
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: "حسابي",
        name: name.text,
        photo: file ?? photo.text,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 40, right: 40),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E2F),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        textColor: Color(0xFFFFFFFF),
                        color: Color(0xFFF4A300),
                        minWidth: 150,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            constraints: BoxConstraints(
                              // هنا بنلغي القيد الافتراضي ونخليه بحد أقصى عرض الشاشة فعلياً
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            builder:
                                (context) => Container(
                                  padding: EdgeInsets.all(20),
                                  height:
                                      MediaQuery.of(context).size.height *
                                      0.4, // نص الشاشة مثلاً
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "اختار صورة ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          XFile? xfile = await ImagePicker()
                                              .pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 85,
                                                maxWidth: 1000,
                                              );

                                          if (xfile != null) {
                                            setState(() {
                                              file = File(xfile.path);
                                            });
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.image),
                                              Text(
                                                " من المعرض  ",
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          var status =
                                              await Permission.camera.request();

                                          if (status.isGranted) {
                                            XFile? xfile = await ImagePicker()
                                                .pickImage(
                                                  source: ImageSource.camera,
                                                  imageQuality: 85,
                                                  maxWidth: 1000,
                                                );
                                            if (xfile != null) {
                                              setState(() {
                                                file = File(xfile.path);
                                              });
                                            }
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.camera_alt),
                                              Text(
                                                " من الكاميرا ",
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          );
                        },
                        child: Row(
                          children: [Icon(Icons.edit), Text("تغير الصورة")],
                        ),
                      ),
                      SizedBox(width: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child:
                            file != null
                                ? Image.file(
                                  file!,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                )
                                : Image.network(
                                  photo.text,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) =>
                                          Icon(Icons.person, size: 70),
                                ),
                      ),
                    ],
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: " الأسم ",
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
                                style: TextStyle(color: Colors.white),
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
                        MaterialButton(
                          onPressed: () {
                            if (loginform.currentState!.validate()) {
                              __isloading
                                  ? null
                                  : setState(() {
                                    __isloading = true;
                                  });
                              print(
                                "==========================vaild ${email.text} ${phone_code}${phone.text} ${country} ${photo.text}  ${name.text} ${file}",
                              );
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
                                  : Text(" تحديث "),
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

import 'package:flutter/material.dart';
import 'package:yallanfoz/components/appbar.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController photo = TextEditingController();
  late bool noti_status = false;
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
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: "الاعدادات",
        name: name.text,
        photo: photo.text,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFff9a9e), Color(0xFFfad0c4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "الإعدادات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: SwitchListTile(
                      tileColor: Colors.black,
                      title: Text(
                        " الأشعارات",
                        style: TextStyle(color: Colors.black),
                      ),

                      // دي خواصه لو انا عايز اديله cutom colors
                      activeColor: Colors.green,
                      activeTrackColor: Colors.greenAccent,
                      value: noti_status, // ده متغير انا عرفته فوق
                      onChanged: (status) {
                        setState(() {
                          noti_status = status;
                          print(noti_status);
                        });
                      },
                    ),
                  ),
                  Form(
                    key: loginform,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Text(
                                  "تغير كلمة المرور ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                  labelText: " كلمة المرور الجديده  ",
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
                                "==========================vaild ${password.text} ${confirmpassword.text}",
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

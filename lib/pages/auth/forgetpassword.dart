import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/auth/forgetpassword_controller.dart';

class Forgetpassword extends GetView<ForgetPasswordController> {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              //MediaQuery.of(context).size.width علشان اجيب عرض الشاشه كامل
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 1, left: 40, right: 40),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: SafeArea(
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                              fontFamily: "Cairo",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Form(
                            key: controller.forgetform,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.email,
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
                                        color: Color(
                                          0xFFFFECB3,
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
                                Obx(
                                  () => MaterialButton(
                                    onPressed: () {
                                      controller.isloading.value
                                          ? null
                                          : controller.forgetpassword();
                                    },
                                    color: Color(0xFFF4A300),
                                    textColor: Colors.white,
                                    minWidth: 200,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child:
                                        controller.isloading.value
                                            ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                            : Text(" ارسال "),
                                  ),
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
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Color(0xFFFFECB3)),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}

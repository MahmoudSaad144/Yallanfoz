import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/country_picker_code.dart';
import 'package:yallanfoz/components/only_country_picker.dart';
import 'package:yallanfoz/controller/auth/register_controller.dart';

class Signup extends GetView<SignupController> {
  const Signup({super.key});

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
                          Image.asset("images/logo.png", width: 60, height: 60),
                          Text(
                            " انشاء حساب جديد ",
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
                            key: controller.signup,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.name,
                                        validator: (name) {
                                          if (name!.isEmpty) {
                                            return " هذا الحقل مطلوب ";
                                          }
                                          return null;
                                        },
                                        //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                        autovalidateMode:
                                            AutovalidateMode.onUnfocus,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: " الأسم ",
                                          labelStyle: TextStyle(
                                            color: Colors.white,
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
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: CountryCodePickerField(
                                        controller: controller.phone,
                                        label: "رقم الهاتف",
                                        onCountryCodeChanged: (code) {
                                          controller.phone_code.value = code;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autovalidateMode:
                                            AutovalidateMode.onUnfocus,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: "البريد الاكتروني",
                                          labelStyle: TextStyle(
                                            color: Colors.white,
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
                                    ),
                                    SizedBox(width: 10),

                                    Expanded(
                                      child: CountryOnlyPickerField(
                                        label: "الدولة",
                                        onCountrySelected: (countryName) {
                                          controller.country.value =
                                              countryName;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => TextFormField(
                                          controller: controller.password,
                                          validator: (password) {
                                            if (password!.isEmpty) {
                                              return " هذا الحقل مطلوب ";
                                            }
                                            return null;
                                          },
                                          //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                          autovalidateMode:
                                              AutovalidateMode.onUnfocus,
                                          obscureText:
                                              !controller
                                                  .isPasswordVisible
                                                  .value,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            labelText: " كلمة المرور  ",
                                            labelStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                controller
                                                    .isPasswordVisible
                                                    .value = !controller
                                                        .isPasswordVisible
                                                        .value;
                                              },
                                              icon: Icon(
                                                controller
                                                        .isPasswordVisible
                                                        .value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0xFFFFECB3),
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
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    Expanded(
                                      child: Obx(
                                        () => TextFormField(
                                          controller:
                                              controller.confirmpassword,

                                          validator: (confirmpassword) {
                                            if (confirmpassword!.isEmpty) {
                                              return " هذا الحقل مطلوب";
                                            }
                                            if (controller
                                                    .confirmpassword
                                                    .text !=
                                                controller.password.text) {
                                              return " كلمة المرور غير متطابفة";
                                            }
                                            return null;
                                          },
                                          //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                          autovalidateMode:
                                              AutovalidateMode.onUnfocus,
                                          obscureText:
                                              !controller
                                                  .isConfirmPasswordVisible
                                                  .value,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            labelText: " تاكيد كلمة المرور ",
                                            labelStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                controller
                                                    .isConfirmPasswordVisible
                                                    .value = !controller
                                                        .isConfirmPasswordVisible
                                                        .value;
                                              },
                                              icon: Icon(
                                                controller
                                                        .isConfirmPasswordVisible
                                                        .value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0xFFFFECB3),
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
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => MaterialButton(
                                    onPressed: () {
                                      controller.isloading.value
                                          ? null
                                          : controller.register();
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
                                            : Text(" سجل الان "),
                                  ),
                                ),

                                SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "هل لديك حساب بالفعل : ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        " تسجيل الدخول ",
                                        style: TextStyle(
                                          color: Color(0xFFFFECB3),
                                        ),
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

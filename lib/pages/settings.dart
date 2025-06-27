import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/setting_controller.dart';

class Setting extends GetView<SettingController> {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 40,
                right: 40,
              ),
              decoration: BoxDecoration(
                color: Colors.black,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
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
                          child: Obx(
                            () => SwitchListTile(
                              tileColor: Colors.black,
                              title: Text(
                                " الأشعارات",
                                style: TextStyle(color: Colors.white),
                              ),

                              // دي خواصه لو انا عايز اديله cutom colors
                              activeColor: Colors.green,
                              activeTrackColor: Colors.greenAccent,
                              value:
                                  controller
                                      .noti_status
                                      .value, // ده متغير انا عرفته فوق
                              onChanged: (status) {
                                controller.noti_status.value = status;
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: controller.updateUserSetting,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 25,
                                      ),
                                      child: Text(
                                        "تغير كلمة المرور ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Obx(
                                      () => TextFormField(
                                        controller: controller.password,
                                        obscureText:
                                            !controller.isPasswordVisible.value,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: " كلمة المرور الجديده  ",
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
                                              controller.isPasswordVisible.value
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
                                        controller: controller.confirmpassword,

                                        validator: (confirmpassword) {
                                          if (confirmpassword !=
                                              controller.password.text) {
                                            return " كلمة المرور غير متطابفة";
                                          }
                                          return null;
                                        },
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
                              SizedBox(height: 10),
                              Obx(
                                () => MaterialButton(
                                  onPressed: () {
                                    controller.updateUserSettingForm();
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
                                          : Text(" تحديث "),
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

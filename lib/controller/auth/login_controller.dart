import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/helper.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/components/otp.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class LoginController extends GetxController {
  final loginform = GlobalKey<FormState>();
  final login_id = TextEditingController();
  final password = TextEditingController();
  final isloading = false.obs;
  final userController = Get.find<UserController>();
  @override
  void onClose() {
    login_id.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (loginform.currentState!.validate()) {
      isloading.value = true;
      String? fcm_token = await getFCMToken();

      final Map<String, dynamic> body = {
        "login_id": login_id.text,
        "password": password.text,
        "fcm_token": fcm_token,
      };
      final response = await ApiService.postRequest(
        "$serverlink/api/accesstoken",
        null,
        body,
      );

      isloading.value = false;
      if (response != null) {
        if (response['status_code'] != null && response['status_code'] == 407) {
          return showOtpDialog();
        }
        userController.userData.value = response['data'];
        await GetStorage().write('token', response['data']['token']);
        Get.offAllNamed("/home");
      }
    }
  }

  void showOtpDialog() {
    Get.dialog(
      OtpDialog(
        onCompleted: (code) async {
          isloading.value = true;
          final fcm = await getFCMToken();
          print(fcm);
          final Map<String, dynamic> body = {
            "email": login_id.text,
            "code": code,
            "fcm_token": fcm,
          };

          final response = await ApiService.postRequest(
            "$serverlink/api/activeCode",
            null,
            body,
          );

          isloading.value = false;
          if (response != null) {
            userController.userData.value = response['data'];
            await GetStorage().write('token', response['data']['token']);
            Get.offAllNamed("/home");
          }
        },
      ),
    );
  }
}

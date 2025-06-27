import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/helper.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/components/otp.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class ForgetPasswordController extends GetxController {
  final forgetform = GlobalKey<FormState>();
  final email = TextEditingController();
  final isloading = false.obs;
  final userController = Get.find<UserController>();

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }

  Future<void> forgetpassword() async {
    if (forgetform.currentState!.validate()) {
      isloading.value = true;

      final Map<String, dynamic> body = {"email": email.text};
      final response = await ApiService.postRequest(
        "$serverlink/api/forgetpassword",
        null,
        body,
      );
      isloading.value = false;
      if (response != null) {
        Get.snackbar(
          "",
          response['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: const SizedBox.shrink(),
        );
        showOtpDialog();
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
            "email": email.text,
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

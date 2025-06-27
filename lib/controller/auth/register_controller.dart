import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/helper.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/components/otp.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class SignupController extends GetxController {
  final signup = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final phone_code = "965".obs;
  final country = "Kuwait".obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isloading = false.obs;
  final userController = Get.find<UserController>();

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.onClose();
  }

  Future<void> register() async {
    if (signup.currentState!.validate()) {
      isloading.value = true;

      final Map<String, dynamic> body = {
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "phone_code": phone_code.value,
        "country": country.value,
        "password": password.text,
        "confirmpassword": confirmpassword.text,
      };

      final response = await ApiService.postRequest(
        "$serverlink/api/signup",
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

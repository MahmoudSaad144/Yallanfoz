import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class SettingController extends GetxController {
  final updateUserSetting = GlobalKey<FormState>();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isloading = false.obs;
  final noti_status = false.obs;
  final userController = Get.find<UserController>();

  @override
  void onInit() {
    var status = userController.userData['noti_status'];
    noti_status.value = status == 1 ? true : false;
    super.onInit();
  }

  Future<void> updateUserSettingForm() async {
    if (updateUserSetting.currentState!.validate()) {
      isloading.value = true;
      final int status;
      if (noti_status.value == true) {
        status = 1;
      } else {
        status = 0;
      }
      print(status);
      final Map<String, dynamic> body = {
        "password": password.text,
        "confirmpassword": confirmpassword.text,
        "noti_status": status,
      };
      final token = GetStorage().read('token');

      final response = await ApiService.postRequest(
        "$serverlink/api/updateuser",
        token,
        body,
      );

      isloading.value = false;
      if (response != null) {
        userController.userData.value = response['data'];
        Get.snackbar(
          "",
          response['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: const SizedBox.shrink(),
        );
      }
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class ProfileController extends GetxController {
  final updateUserForm = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final Rx<File?> file = Rx<File?>(null);
  final isloading = false.obs;
  final phone_code = "".obs;
  final country = "".obs;
  final photo = "".obs;
  final userController = Get.find<UserController>();

  @override
  void onInit() {
    name.text = userController.userData['name'];
    email.text = userController.userData['email'];
    phone.text = userController.userData['phone'] ?? "";
    phone_code.value = userController.userData['phone_code'] ?? "";
    country.value = userController.userData['country'] ?? "";
    photo.value = "$serverlink/${userController.userData['photo']}";
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    super.onClose();
  }

  Future<void> updateUser() async {
    if (updateUserForm.currentState!.validate()) {
      isloading.value = true;

      final Map<String, dynamic> body = {
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "phone_code": phone_code.value,
        "country": country.value,
      };

      final token = GetStorage().read('token');

      final response = await ApiService.sendPostWithMultipart(
        url: "$serverlink/api/updateuser",
        token: token,
        body: body,
        file: file.value,
        fileField: "photo",
      );

      isloading.value = false;
      if (response != null) {
        userController.userData.value = response['data'];
        photo.value = "$serverlink/${userController.userData['photo']}";
        file.value = null;
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

  Future<File?> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1000,
      );

      if (pickedFile == null) return null;

      // اقرأ الصورة كـ bytes
      final originalBytes = await pickedFile.readAsBytes();

      // فك ترميز الصورة
      final decodedImage = img.decodeImage(originalBytes);
      if (decodedImage == null) return null;

      // حول الصورة إلى JPEG
      final jpgBytes = img.encodeJpg(decodedImage);

      // احفظ الصورة مؤقتًا
      final tempDir = await getTemporaryDirectory();
      final tempPath =
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final jpgFile = await File(tempPath).writeAsBytes(jpgBytes);

      return jpgFile;
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ أثناء اختيار الصورة",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}

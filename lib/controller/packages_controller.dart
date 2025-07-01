import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class PackagesController extends GetxController {
  final RxList<Map<String, dynamic>> packages = <Map<String, dynamic>>[].obs;
  Rxn<int> isSelectedIndex = Rxn<int>();
  final userController = Get.find<UserController>();
  final loading = false.obs;
  @override
  Future<void> onInit() async {
    await GetPackages();
    super.onInit();
  }

  Future<void> GetPackages() async {
    loading.value = true;
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest(
      "$serverlink/api/packages",
      token,
    );
    if (response != null) {
      packages.value = List<Map<String, dynamic>>.from(response['data']);
      loading.value = false;
    }
  }

  Future<void> BuyPackages() async {}

  Color hexToColor(String hex) {
    hex = hex.replaceAll("#", "");

    if (hex.length == 6) {
      hex = "FF$hex"; // نضيف الشفافية لو مش موجودة
    }

    return Color(int.parse("0x$hex"));
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';

class GamePageController extends GetxController {
  final RxMap<String, dynamic> mygame = <String, dynamic>{}.obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> StartMyGame() async {
    loading.value = true;
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest(
      "$serverlink/api/mygames/1",
      token,
    );
    if (response != null) {
      mygame.value = response['data'];
      loading.value = false;
    }
  }
}

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';

class UserController extends GetxController {
  final RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  Future<void> getUser() async {
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest("$serverlink/api/user", token);
    if (response != null) {
      userData.value = response['data'];
    }
  }

  Future<void> logout() async {
    final token = GetStorage().read('token');
    final response = await ApiService.postRequest(
      "$serverlink/api/logout",
      token,
      {},
    );
    if (response != null) {
      userData.clear();
      await GetStorage().remove('token');
      Get.offAllNamed("/login");
    }
  }
}

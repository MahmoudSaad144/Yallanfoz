import 'package:get/get.dart';
import 'package:yallanfoz/controller/auth/forgetpassword_controller.dart';
import 'package:yallanfoz/controller/auth/login_controller.dart';
import 'package:yallanfoz/controller/auth/register_controller.dart';
import 'package:yallanfoz/controller/profile_controller.dart';
import 'package:yallanfoz/controller/setting_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: false);
  }
}

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController(), fenix: false);
  }
}

class ForgetpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController(), fenix: false);
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: false);
  }
}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController(), fenix: false);
  }
}

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yallanfoz/binding/binding.dart';
import 'package:yallanfoz/home.dart';
import 'package:yallanfoz/pages/aboutus.dart';
import 'package:yallanfoz/pages/answer.dart';
import 'package:yallanfoz/pages/auth/forgetpassword.dart';
import 'package:yallanfoz/pages/auth/login.dart';
import 'package:yallanfoz/pages/auth/register.dart';
import 'package:yallanfoz/pages/gamepage.dart';
import 'package:yallanfoz/pages/games.dart';
import 'package:yallanfoz/pages/mygames.dart';
import 'package:yallanfoz/pages/packages.dart';
import 'package:yallanfoz/pages/profile.dart';
import 'package:yallanfoz/pages/question.dart';
import 'package:yallanfoz/pages/settings.dart';
import 'package:yallanfoz/pages/whoanswer.dart';
import 'package:yallanfoz/splash.dart';

List<GetPage> Routes() {
  return [
    GetPage(name: "/splash", page: () => Splash()),
    GetPage(name: "/login", page: () => Login(), binding: LoginBinding()),
    GetPage(name: "/register", page: () => Signup(), binding: SignupBinding()),
    GetPage(
      name: "/forgetpassword",
      page: () => Forgetpassword(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/profile", page: () => Profile(), binding: ProfileBinding()),
    GetPage(
      name: "/packages",
      page: () => Packages(),
      binding: PackagesBinding(),
    ),
    GetPage(
      name: "/settingpage",
      page: () => Setting(),
      binding: SettingBinding(),
    ),
    GetPage(name: "/games", page: () => Games(), binding: GamesBinding()),
    GetPage(name: "/mygames", page: () => Mygames(), binding: MyGamesBinding()),
    GetPage(name: "/gamepage", page: () => Gamepage()),
    GetPage(name: "/question", page: () => Questionpage()),
    GetPage(name: "/answer", page: () => Answerpage()),
    GetPage(name: "/whoanswer", page: () => WhoAnswerpage()),
    GetPage(name: "/contactus", page: () => AboutUs()),
  ];
  // Get.toNamed("/home"); // للذهاب إلى صفحة مع الاحتفاظ بالباقي اسفله
  // Get.offNamed("/login"); // للذهاب مع إزالة الصفحة الحالية
  //Get.offAllNamed(/home); // يحذف كل الصفحات اللي في الـ stack ويروح للصفحة الجديدة
  // Get.offAndToNamed  //
  // Get.back(); // للرجوع للخلف
}

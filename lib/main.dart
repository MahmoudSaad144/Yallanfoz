import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yallanfoz/controller/appinfo_controller.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';
import 'package:yallanfoz/controller/user_controller.dart';
import 'package:yallanfoz/routes/routes.dart';
import 'package:yallanfoz/splash.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ده مهم جدًا
  await MainRequestBeforeStartApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // منع تأثر الخط بإعدادات الجهاز
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        );
      },

      home: Splash(),

      // Define routes using GetX
      getPages: Routes(),
    );
  }
}

Future<void> setupNotifications() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@drawable/ic_stat_ic_notification');

  // ✅ التعديل هنا باستخدام الكلاس الصحيح
  const DarwinInitializationSettings iosInitializationSettings =
      DarwinInitializationSettings();

  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );

  // 1) مسح كل الإشعارات
  await flutterLocalNotificationsPlugin.cancelAll();

  // 2) تصفير البادج على iOS
  try {
    await const MethodChannel('app.badge').invokeMethod('clearBadge');
  } catch (e) {
    // لو Android مش هتشتغل القناة دي، متقلقش
    print('Failed to clear badge: $e');
  }

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  // طلب إذن الإشعارات
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional notification permission');
  } else {
    print('User declined or has not accepted notification permission');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      // لو عايز اعمل دالة تتنفذ اول ما يجي اشعار وهوا التطبيق مفتوح
      print("get noti");
    }
  });
}

Future<void> MainRequestBeforeStartApp() async {
  // تثبيت وضع الشاشة
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  await Firebase.initializeApp();

  await GetStorage.init(); // افتح التخزين وحضّره
  Get.put(UserController());
  Get.put(GamePageController());
  Get.put(AppInfoController());

  // طلب الأذونات أول مرة فقط
  await setupNotifications();
  PermissionStatus cameraStatus = await Permission.camera.request();

  if (cameraStatus.isGranted) {
    print("كل الأذونات اتوافق عليها ✅");
  } else {
    print("فيه إذن مرفوض ❌");
  }
  // إخفاء شريط الحالة
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

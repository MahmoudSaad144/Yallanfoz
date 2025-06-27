import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFCMToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  return await messaging.getToken();
}

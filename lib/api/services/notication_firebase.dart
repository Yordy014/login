// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificactionService {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//   static String token = '';

//   static Future _backgroundHandler(RemoteMessage message) async {
//     print('_backgroundHandler ${message.messageId}');
//   }

//   static Future _onMessageHandler(RemoteMessage message) async {
//     print('_onMessageHandler ${message.messageId}');
//   }

//   static Future _onMessageOpenApp(RemoteMessage message) async {
//     print('_onMessageOpenApp ${message.messageId}');
//   }

//   static Future initializeApp() async {
//     await Firebase.initializeApp();
//     token = await FirebaseMessaging.instance.getToken();
//     print(token);

//     //handler call
//     FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
//     FirebaseMessaging.onMessage.listen(_onMessageHandler);
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
//   }
// }

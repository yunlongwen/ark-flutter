import 'package:firebase_messaging/firebase_messaging.dart';




// Future<bool> _requestNotificationPermissionIOS() async {
//   final settings = await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
//       ?.requestPermissions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   return settings?.alert ?? false;
// }


Future<bool> _requestNotificationPermissionAndroid() async {
  final messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission(
    sound: true,
    badge: true,
    alert: true,
    announcement: false,
  );

  return settings.authorizationStatus == AuthorizationStatus.authorized;
}

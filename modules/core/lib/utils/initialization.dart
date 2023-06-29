import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InitializationManager {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {

    // 初始化 FlutterLocalNotificationsPlugin
    await _initializeFlutterLocalNotifications();
  }

  static Future<void> _initializeFlutterLocalNotifications() async {
    // FlutterLocalNotificationsPlugin 的初始化代码
    // ...
    final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }
}

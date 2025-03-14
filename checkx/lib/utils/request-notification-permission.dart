import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestPermissions() async {
  final iOS = notificationsPlugin.resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>();

  await iOS?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
  );
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channelId', 'notification push');

Future<void> showNotification() async {
  flutterLocalNotificationsPlugin.show(
      0, 'jdjdj', 'dkdkd', initializationSettings as NotificationDetails?);
}

NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

void pushNotification() {
  flutterLocalNotificationsPlugin.show(0, 'ваше', 'fjfjf', notificationDetails);
}

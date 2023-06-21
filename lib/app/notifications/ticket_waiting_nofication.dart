import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:united102/main.dart';

AndroidInitializationSettings androidInitializationSettings =
AndroidInitializationSettings('@mipmap/ic_launcher');

AndroidNotificationDetails androidNotificationDetails =
AndroidNotificationDetails('ticketShow', 'ticketShowName',
    priority: Priority.high, importance: Importance.max);
NotificationDetails notificationDetails =
NotificationDetails(android: androidNotificationDetails);

InitializationSettings initializationSettings =
InitializationSettings(android: androidInitializationSettings);

void showNotification() {
  flutterLocalNotificationsPlugin.show(
      0,
      'Ваша очередь наступить через 15 минут поспешите',
      'Топопись',
      notificationDetails);
}

// Future<void> showTotification5Minute(DateTime dateTime) async {
//   flutterLocalNotificationsPlugin.zonedSchedule(
//       0, 'Ваша очередь насупит через пять минут', 'бегом',
//       DateTime.now().add(Duration(seconds: 5)), notificationDetails,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation
//           .absoluteTime);
// }

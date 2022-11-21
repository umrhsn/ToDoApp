import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:to_do_app/main.dart';

class NotificationService {
  final DateTime dateTime;

  NotificationService(this.dateTime);

  // FIXME: notification now is not shown for some reason, and method is only customized to endTimeController.text and needs to consider reminder values
  void scheduleAlarm() async {
    var scheduleNotificationDateTime = DateTime.now().add(Duration(
        days: dateTime.day, hours: dateTime.hour, minutes: dateTime.minute));

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'alarm_notif', 'alarm_notif',
        channelDescription: 'Channel for Alarm notification',
        icon: 'todo_icon',
        sound: RawResourceAndroidNotificationSound('notification_sound'),
        largeIcon: DrawableResourceAndroidBitmap('todo_icon'));

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
        sound: 'notification_sound.mp3',
        // TODO: convert to wav (mp3 not supported iOS), implement when having MacOS virtual machine or at least Xcode
        presentAlert: true,
        presentBadge: true,
        presentSound: true);

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Office',
        'Good morning! Time for office',
        scheduleNotificationDateTime,
        platformChannelSpecifics);
  }
}

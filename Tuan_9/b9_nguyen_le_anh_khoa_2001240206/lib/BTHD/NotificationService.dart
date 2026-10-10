import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Ho_Chi_Minh'));

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _plugin.initialize(settings: settings);

    await _requestPermission();
  }

  Future<void> _requestPermission() async {
    final androidImpl = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await androidImpl?.requestNotificationsPermission();
    await androidImpl?.requestExactAlarmsPermission();

    var status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    }
      
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  static AndroidNotificationDetails _createAndroidDetails({
    required String channelId,
    required String channelName,
    String? channelDescription,
  }) {
    return AndroidNotificationDetails(
      channelId, 
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      playSound: true,
      enableVibration: true,
      showWhen: true,
    );
  }

  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduleTime,
    required AndroidNotificationDetails androidDetails,
  }) async {
    try {
      await _plugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.from(scheduleTime, tz.local),
        notificationDetails: NotificationDetails(android: androidDetails),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } catch (_) {
      await _plugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tz.TZDateTime.from(scheduleTime, tz.local),
        notificationDetails: NotificationDetails(android: androidDetails),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    }
  }

  Future<void> showSimpleNotification(
    int id,
    String channelId,
    String channelName,
    String title,
    String body,
  ) async {
    final details = _createAndroidDetails(channelId: channelId, channelName: channelName);
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(android: details)
    );
  }

  Future<void> scheduleNotificationAfter(
    Duration delay, 
    String channelId, 
    String channelName, 
    String channelDescription, {
    int id = 1,
    String? title,
  }) async {
    final details = _createAndroidDetails(
      channelId: channelId, 
      channelName: channelName,
      channelDescription: channelDescription,
    );

    final scheduleTime = tz.TZDateTime.now(tz.local).add(delay);

    await _scheduleNotification(
      id: id, 
      title: title ?? channelName, 
      body: channelDescription, 
      scheduleTime: scheduleTime, 
      androidDetails: details
    );
  }

  Future<void> scheduleNotificationDateTime({
    required int id,
    required DateTime scheduleTime,
    required String channelId,
    required String channelName,
    required String title,
    required String body,
  }) async {
    final details = _createAndroidDetails(
      channelId: channelId,
      channelName: channelName,
      channelDescription: body,
    );

    await _scheduleNotification(
      id: id,
      title: title,
      body: body,
      scheduleTime: scheduleTime,
      androidDetails: details,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id: id);
  }

  Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}


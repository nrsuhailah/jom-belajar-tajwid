import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<void> init() async {
    tz.initializeTimeZones();
    final String currentTimezone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimezone));

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@drawable/ic_stat_circle_notifications'); // <-- updated

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationTap();
      },
    );

    final NotificationAppLaunchDetails? launchDetails =
        await _plugin.getNotificationAppLaunchDetails();
    if (launchDetails?.didNotificationLaunchApp ?? false) {
      Future.delayed(const Duration(milliseconds: 500), _handleNotificationTap);
    }

    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await Permission.notification.request();
    await Permission.ignoreBatteryOptimizations.request();
  }

  void _handleNotificationTap() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/home',
      (route) => false,
    );
  }

  Future<void> jadualkanPeringatan(
    TimeOfDay masa, {
    bool isEn = false,
  }) async {
    await batalkanPeringatan();

    final title = isEn
        ? '📖 Time to Learn Tajwid!'
        : '📖 Masa Belajar Tajwid!';
    final body = isEn
        ? "Don't forget to study today. Knowledge is light! ✨"
        : 'Jangan lupa belajar hari ini. Ilmu adalah cahaya! ✨';

    final now = tz.TZDateTime.now(tz.local);
    var jadual = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      masa.hour,
      masa.minute,
      0,
    );

    if (jadual.isBefore(now)) {
      jadual = jadual.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      0,
      title,
      body,
      jadual,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'peringatan_belajar_v2',
          'Peringatan Belajar',
          channelDescription: 'Peringatan harian untuk belajar Tajwid',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@drawable/ic_stat_circle_notifications', // <-- updated
          color: Color(0xFF073793),
          playSound: true,
          sound:RawResourceAndroidNotificationSound('notification_sound'),
          enableVibration: true,
          fullScreenIntent: true,
          visibility: NotificationVisibility.public,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          sound: 'notification_sound.mp3,'
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> batalkanPeringatan() async {
    await _plugin.cancel(0);
  }

  Future<bool> adaPeringatan() async {
    try {
      final pending = await _plugin.pendingNotificationRequests();
      return pending.any((n) => n.id == 0);
    } catch (e) {
      return false;
    }
  }
}
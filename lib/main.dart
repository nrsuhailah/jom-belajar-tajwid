import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'screens/notification.dart';
import 'database/database_helper.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().init();
  await DatabaseHelper.instance.database; 

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const TajwidApp());
}
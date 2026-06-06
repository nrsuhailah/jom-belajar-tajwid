import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/arabic_size.dart';
import '../l10n/locale_provider.dart';    // ← tambah import
import 'logo.dart';
import 'screens/home_page.dart';
import 'screens/notification.dart';

class TajwidApp extends StatelessWidget {
  const TajwidApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navyBlueReal = Color(0xFF073793);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArabicSizeProvider>(
          create: (_) => ArabicSizeProvider()..load(),
        ),
        ChangeNotifierProvider<LocaleProvider>(   // ← tambah ni
          create: (_) => LocaleProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Tajwid Master',
        debugShowCheckedModeBanner: false,
        navigatorKey: NotificationService.navigatorKey,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: navyBlueReal,
          colorScheme: ColorScheme.fromSeed(
            seedColor: navyBlueReal,
            primary: navyBlueReal,
          ),
          fontFamily: 'Roboto',
        ),
        home: const LogoPage(),
        routes: {
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
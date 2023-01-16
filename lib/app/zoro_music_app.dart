import 'package:advanced_flutter_projexct/presentation/pages/pre_login/pre_login_page.dart';
import 'package:advanced_flutter_projexct/presentation/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../theme/light_theme.dart';

class ZoroMusicApp extends StatefulWidget {
  const ZoroMusicApp({Key? key}) : super(key: key);

  const ZoroMusicApp._internal(); // Private named constructor

  static const ZoroMusicApp instance =
      ZoroMusicApp._internal(); //  Single instance -singleton

  factory ZoroMusicApp.factor() => instance; // factory for class instance

  @override
  State<ZoroMusicApp> createState() => _ZoroMusicAppState();
}

class _ZoroMusicAppState extends State<ZoroMusicApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: ThemeData(fontFamily: 'Poppins'),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}

import 'package:advanced_flutter_projexct/extensions/context_extension.dart';
import 'package:advanced_flutter_projexct/extensions/text_style_extension.dart';
import 'package:advanced_flutter_projexct/presentation/pages/pre_login/pre_login_page.dart';
import 'package:advanced_flutter_projexct/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';

import '../../../common/assets.dart';
import '../../../common/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashTime = 3;

  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashTime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
        return const PreLoginPage();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            height: context.maxHeight,
            width: context.maxWidth,
            child: Image.asset(Assets.splash),
          ),
          Positioned(
            bottom: dp15,
            child: Text(
              'version 1.0.0',
              style: TextStyle(
                color: grey1,
                fontSize: sp11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

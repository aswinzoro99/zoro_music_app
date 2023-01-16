import 'package:advanced_flutter_projexct/presentation/pages/pre_login/pre_login_page.dart';
import 'package:flutter/material.dart';

import '../../../common/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return const PreLoginPage();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //vertically align center
          children: <Widget>[
            SizedBox(
                height: 200, width: 200, child: Image.asset(Assets.splash)),
            Container(
              margin: const EdgeInsets.only(top: 30),
              //margin top 30
              child: const Text(
                "Zoro Music App",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                "Version: 1.0.0",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:magdsoftfluttertask/presintation/ui/login/login_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  static const String screenName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundImage: Image.asset("assets/images/splash1.png"),
      childWidget: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset("assets/images/e.png"),
      ),
      defaultNextScreen: const LoginScreen(),
    );
  }
}

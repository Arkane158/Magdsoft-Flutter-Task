import 'package:flutter/material.dart';
import 'package:magdsoftfluttertask/model/ui/login/login_screen.dart';
import 'package:magdsoftfluttertask/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.myTheme,
      routes: {LoginScreen.screenName: (context) => const LoginScreen()},
      initialRoute: LoginScreen.screenName,
    );
  }
}

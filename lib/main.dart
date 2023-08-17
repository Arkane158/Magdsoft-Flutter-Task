import 'package:flutter/material.dart';
import 'package:magdsoftfluttertask/presintation/providers/home_provider.dart';
import 'package:magdsoftfluttertask/presintation/ui/itemview/item_view_screen.dart';
import 'package:magdsoftfluttertask/presintation/ui/my_theme.dart';
import 'package:magdsoftfluttertask/presintation/ui/settings/settings_screen.dart';
import 'package:magdsoftfluttertask/presintation/ui/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:magdsoftfluttertask/presintation/ui/home/home_screen.dart';
import 'package:magdsoftfluttertask/presintation/ui/login/login_screen.dart';
import 'package:magdsoftfluttertask/presintation/ui/otp/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BrandSelectionNotifier>(
          create: (_) => BrandSelectionNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
        routes: {
          LoginScreen.screenName: (context) => const LoginScreen(),
          OtpScreen.screenName: (context) => const OtpScreen(),
          HomeScreen.screenName: (context) => const HomeScreen(),
          SettingsScreen.screenName: (context) => const SettingsScreen(),
          Splash.screenName: (context) => const Splash(),
          ItemViewScreen.screenName: (context) => const ItemViewScreen()
        },
        initialRoute: Splash.screenName,
      ),
    );
  }
}

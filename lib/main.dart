import 'package:flutter/material.dart';
import 'package:magdsoftfluttertask/model/providers/home_provider.dart';
import 'package:magdsoftfluttertask/model/ui/settings/settings_screen.dart';
import 'package:magdsoftfluttertask/model/ui/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:magdsoftfluttertask/model/ui/home/home_screen.dart';
import 'package:magdsoftfluttertask/model/ui/login/login_screen.dart';
import 'package:magdsoftfluttertask/model/ui/otp/otp_screen.dart';
import 'package:magdsoftfluttertask/my_theme.dart';

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
          SettingsScreen.screenName:(context)=>const SettingsScreen(),
          Splash.screenNames:(context) => const Splash()
        },
        initialRoute: Splash.screenNames,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTheme {
  static const Color blue = Color(0xff0062BD);
  static final myTheme = ThemeData(
  
      primaryColor: blue,
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      textTheme:const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
              titleMedium: TextStyle(color: blue,fontSize:20 )));
}

import 'package:flutter/material.dart';

class MyTheme {
  static final primaryTheme = ThemeData(
    fontFamily: 'Arciform',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      filled: true,
    ),
  );
}

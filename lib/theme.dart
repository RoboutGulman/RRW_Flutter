import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  brightness: Brightness.dark,
  accentColor: Colors.amber,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
  primaryTextTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 20,
      color: Colors.black
    )
  ),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.black,
  brightness: Brightness.light,
  accentColor: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
  primaryTextTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 20,
      color: Colors.black
    )
  ),
);
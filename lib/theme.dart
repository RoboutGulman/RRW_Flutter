import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  brightness: Brightness.dark,
  accentColor: Colors.amber,
);

final lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.black,
  brightness: Brightness.light,
  accentColor: Colors.blue,
);
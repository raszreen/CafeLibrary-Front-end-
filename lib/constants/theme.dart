import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white24,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        textStyle: const TextStyle(
          color: Colors.red,
        ),
        side: const BorderSide(
            color: Colors.red, width: 1.7),
        disabledForegroundColor:
        Colors.red.withOpacity(0.38)),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white24,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  )
);

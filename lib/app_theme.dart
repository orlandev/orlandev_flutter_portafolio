import 'package:flutter/material.dart';

class AppTheme {
  final dark = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.green,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.black54,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white));

  final light = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          secondary: Colors.green,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.black54,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white));
}

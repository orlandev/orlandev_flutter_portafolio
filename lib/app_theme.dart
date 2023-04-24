import 'package:flutter/material.dart';

class AppTheme {
  final dark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.blue);

  final light = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.blue);
}

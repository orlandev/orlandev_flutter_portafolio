import 'package:flutter/material.dart';

class DeskAppData {
  String name;
  Color color;
  IconData icon;
  Gradient? gradient;
  String navUrl;
  bool isExternalApp;

  DeskAppData(
      {required this.name,
      required this.color,
      required this.icon,
      required this.navUrl,
      required this.isExternalApp,
      this.gradient});
}

import 'package:flutter/material.dart';

class DeskAppData {
  String name;
  Color color;
  IconData icon;
  String navUrl;
  bool isExternalApp;

  DeskAppData(
      {required this.name,
      required this.color,
      required this.icon,
      required this.navUrl,
      required this.isExternalApp});
}

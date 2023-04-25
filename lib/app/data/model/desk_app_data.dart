import 'package:flutter/material.dart';

class DeskAppData {
  String name;
  Color? color;
  IconData? icon;
  String? assetSvg;
  Gradient? gradient;
  String navUrl;
  bool isExternalApp;

  DeskAppData(
      {required this.name,
        this.icon,
      required this.navUrl,
      required this.isExternalApp,
      this.color,
      this.assetSvg,
      this.gradient});

// : assert(color == null && gradient == null && iconImage == null,'At least one of the three parameters color, gradient iconImage must contain information; all three cannot be null.',)
}

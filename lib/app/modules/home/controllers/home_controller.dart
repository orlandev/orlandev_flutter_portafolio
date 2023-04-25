import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../data/model/desk_app_data.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final List<DeskAppData> deskApps = [
    DeskAppData(
        name: "Facebook",
        color: const Color(0xFF0165E1),
        icon: FontAwesomeIcons.facebookF,
        navUrl: "",
        isExternalApp: true),
    DeskAppData(
        name: "Github",
        color: const Color(0xFF000000),
        icon: FontAwesomeIcons.github,
        navUrl: "",
        isExternalApp: true),
    DeskAppData(
        name: "Linkedin",
        color: const Color(0xFF0072b1),
        icon: FontAwesomeIcons.linkedinIn,
        navUrl: "",
        isExternalApp: true),
    DeskAppData(
        name: "WhatsApp",
        color: const Color(0xFF4FCE5D),
        icon: FontAwesomeIcons.whatsapp,
        navUrl: "",
        isExternalApp: true),
    DeskAppData(
        name: "Twitter",
        color: const Color(0xFF1da1f2),
        icon: FontAwesomeIcons.twitter,
        navUrl: "",
        isExternalApp: true),
    DeskAppData(
        name: "Telegram",
        color: const Color(0xff229ED9),
        icon: FontAwesomeIcons.telegram,
        navUrl: "",
        isExternalApp: true),
    DeskAppData(
        name: "Instagram",
        icon: FontAwesomeIcons.instagram,
        navUrl: "",
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple,
            Colors.pink,
            Colors.orange,
          ],
        ),
        isExternalApp: true),
    DeskAppData(
        name: "Fotos",
        assetSvg: Assets.imagesIosPhotos,
        color: Colors.white,
        navUrl: "",
        isExternalApp: true),
  ];
}

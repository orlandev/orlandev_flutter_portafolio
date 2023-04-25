import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (GetPlatform.isMobile)
            ? const HomeParallaxContainer(
          backgroundUrl:
          "https://ik.imagekit.io/6xgh00mrhaz/flutter_portfolio/ios_1.webp",
          front: HomeContent(),
        )
            : NotMobileContainer(
            maxHeight: Get.height * 0.80,
            maxWidth: Get.width * 0.30,
            backgroundUrl:
            "https://ik.imagekit.io/6xgh00mrhaz/flutter_portfolio/ios_1.webp",
            child: const HomeParallaxContainer(
              backgroundUrl:
              "https://ik.imagekit.io/6xgh00mrhaz/flutter_portfolio/ios_1.webp",
              front: HomeContent(),
            )));
  }
}

class NotMobileContainer extends StatelessWidget {
  const NotMobileContainer({Key? key,
    required this.child,
    required this.backgroundUrl,
    required this.maxHeight,
    required this.maxWidth})
      : super(key: key);

  final Widget child;
  final String backgroundUrl;
  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          backgroundUrl,
          fit: BoxFit.cover,
        ),
        const Center(
          child: Text("ON DEV"),
        )
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 6,
          child: Apps(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomBarIOS(
            height: Get.height * 0.14,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}

class BottomBarIOS extends StatelessWidget {
  const BottomBarIOS({Key? key,
    required this.width,
    required this.height,
    this.blurSigma = 20,
    this.borderRadius = 35})
      : super(key: key);

  final double width;
  final double height;
  final double blurSigma;
  final double borderRadius;

  //TODO CALCULATE THE ICONS SIZE

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      IosIconButton(
                          iconData: CupertinoIcons.phone_fill,
                          color: Color(0xFF3ABE35)),
                      IosIconButton(
                          iconData: CupertinoIcons.chat_bubble_fill,
                          color: Color(0xFF3ABE35)),
                      IosIconButton(
                          iconData: CupertinoIcons.music_note_2,
                          color: Color(0xFFDE0404)),
                      IosIconButton(
                          iconData: FontAwesomeIcons.facebookF,
                          color: Color(0xFF0165E1)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const double iOSIconsRoundValue = 14;

class IosIconButton extends StatelessWidget {
  const IosIconButton({Key? key,
    this.height = 60,
    this.width = 60,
    required this.iconData,
    required this.color,
    this.onTap})
      : super(key: key);

  final double height;
  final double width;
  final IconData iconData;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(iOSIconsRoundValue),
              )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(iOSIconsRoundValue),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white30,
                      Colors.transparent,
                    ])),
            child: Center(child: Icon(size: 44, iconData)),
          ),
        ],
      ),
    );
  }
}

class DeskAppData {
  String name;
  Color color;
  IconData icon;
  String navUrl;
  bool isExternalApp;

  DeskAppData({
    required this.name,
    required this.color,
    required this.icon,
    required this.navUrl,
    required this.isExternalApp });
}

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

//TODO EXTRACT THIS LIST
    List<DeskAppData> deskApps = [
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
    ];


    return GridView.count(
      crossAxisCount: 4,
      children: [
         for(DeskAppData app in deskApps)
           DeskApp(icon: app.icon, name: app.name, color: app.color)
      ],
    );
  }
}

class DeskApp extends StatelessWidget {
  const DeskApp({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String name;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IosIconButton(iconData: icon, color: color),
          const SizedBox(
            height: 4,
          ),
          Expanded(
              child: Text(name,
                  style: const TextStyle(
                      fontSize: 12, fontFamily: 'SanFrancisco')))
        ],
      ),
    );
  }
}

class HomeParallaxContainer extends StatelessWidget {
  const HomeParallaxContainer(
      {Key? key, required this.backgroundUrl, required this.front})
      : super(key: key);

  final String backgroundUrl;
  final Widget front;

  //TODO use Cached Image

  @override
  Widget build(BuildContext context) {
    return Parallax(
        sensor: ParallaxSensor.gyroscope,
        layers: [
          Layer(
            sensitivity: 5,
            image: CachedNetworkImageProvider(backgroundUrl),
            imageFit: BoxFit.cover,
            preventCrop: true,
            imageBlurValue: 0,
          ),
        ],
        child: front);
  }
}

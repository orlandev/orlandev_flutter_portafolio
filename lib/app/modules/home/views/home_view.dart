import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:orlandev_flutter_portafolio/generated/assets.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';

import '../../../data/model/desk_app_data.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (GetPlatform.isMobile)
            ? HomeParallaxContainer(
                backgroundUrl:
                    "https://ik.imagekit.io/6xgh00mrhaz/flutter_portfolio/ios_1.webp",
                front: HomeContent(listOfApps: controller.deskApps),
              )
            : NotMobileContainer(
                maxHeight: Get.height * 0.80,
                maxWidth: Get.width * 0.30,
                backgroundUrl:
                    "https://ik.imagekit.io/6xgh00mrhaz/flutter_portfolio/ios_1.webp",
                child: HomeParallaxContainer(
                  backgroundUrl:
                      "https://ik.imagekit.io/6xgh00mrhaz/flutter_portfolio/ios_1.webp",
                  front: HomeContent(listOfApps: controller.deskApps),
                )));
  }
}

class NotMobileContainer extends StatelessWidget {
  const NotMobileContainer(
      {Key? key,
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
  const HomeContent({Key? key, required this.listOfApps}) : super(key: key);

  final List<DeskAppData> listOfApps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Apps(listOfApps: listOfApps),
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
  const BottomBarIOS(
      {Key? key,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        assetSvgIcon: Assets.imagesIosSettings,
                        iconSize: 52,
                        color: Color(0xFF7E7A7A),
                      ),
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

class IosIconButtonGradient extends StatelessWidget {
  const IosIconButtonGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class IosIconButton extends StatelessWidget {
  const IosIconButton(
      {Key? key,
      this.height = 60,
      this.width = 60,
      this.iconData,
      this.color,
      this.onTap,
      this.gradient,
      this.assetSvgIcon,
      this.iconSize = 44.0})
      : super(key: key);

  final double iconSize;

  final double height;
  final double width;
  final IconData? iconData;
  final String? assetSvgIcon;
  final Color? color;
  final Gradient? gradient;
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
                  gradient: gradient)),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(iOSIconsRoundValue),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white38,
                      Colors.transparent,
                    ])),
            child: Center(
                child: (assetSvgIcon == null)
                    ? Icon(size: iconSize, iconData)
                    : SvgPicture.asset(
                        assetSvgIcon ?? "",
                        width: iconSize,
                        height: iconSize,
                      )),
          ),
        ],
      ),
    );
  }
}

class Apps extends StatelessWidget {
  const Apps({Key? key, required this.listOfApps}) : super(key: key);

  final List<DeskAppData> listOfApps;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 4,
      children: [for (DeskAppData app in listOfApps) DeskApp(appData: app)],
    );
  }
}

class DeskApp extends StatelessWidget {
  const DeskApp({
    super.key,
    this.onTap,
    required this.appData,
  });

  final DeskAppData appData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IosIconButton(
            iconData: appData.icon,
            assetSvgIcon: appData.assetSvg,
            color: appData.color,
            gradient: appData.gradient,
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
              child: Text(appData.name,
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
              sensitivity: 10,
              imageBlurValue: 0,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: OctoImage(
                  placeholderBuilder:
                      OctoPlaceholder.blurHash("LbCHNeOnILNbKBj^xGX79zwJbuot"),
                  image: CachedNetworkImageProvider(backgroundUrl),
                  fit: BoxFit.cover,
                ),
              )),
        ],
        child: front);
  }
}

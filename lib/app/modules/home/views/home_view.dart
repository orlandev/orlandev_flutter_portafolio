import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(children: [
          Header(
            name:
                controller.currentPortfolio.value.portfolio?.info?.name ?? " ",
            image: 'https://picsum.photos/id/237/200/300',
            description: controller
                    .currentPortfolio.value.portfolio?.info?.description ??
                " ",
            location:
                controller.currentPortfolio.value.portfolio?.location ?? " ",
          ),
        ]),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.location,
  });

  final String name;
  final String image;
  final String description;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topSpace,
          avatar,
          userInfo,
        ],
      ),
    );
  }

  Widget get topSpace => SizedBox(height: Get.height * 0.08);

  Widget get userInfo => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                maxFontSize: 80,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
                minFontSize: 18,
                textScaleFactor: 1,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AutoSizeText(
                description,
                maxFontSize: 50,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
                minFontSize: 12,
                textScaleFactor: 1,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AutoSizeText(
                location,
                maxFontSize: 50,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
                minFontSize: 12,
                textScaleFactor: 1,
                maxLines: 2,
              ),
            ),
          ],
        ),
      );

  static const radiusConstant = 0.15;

  Widget get avatar => CircleAvatar(
        backgroundColor: Colors.grey,
        radius: Get.width * radiusConstant,
        child: CircleAvatar(
          radius: Get.width * (radiusConstant - 0.01),
          backgroundImage: NetworkImage(image),
        ),
      );
}

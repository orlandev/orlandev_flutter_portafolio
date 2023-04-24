import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HomeParallaxContainer extends StatelessWidget {
  const HomeParallaxContainer(
      {Key? key, required this.front, required this.back})
      : super(key: key);

  final Widget front;
  final Widget back;

  @override
  Widget build(BuildContext context) {
    return Parallax(
        sensors: ParallaxSensor.accelerometer,
        layers: [
          Layer(
            sensitivity: 1,
            image: NetworkImage('https://example.com/background.png'),
            preventCrop: true,
            imageBlurValue: 5,
          ),
          Layer(
            sensitivity: 7,
            image: AssetImage('assets/middle_layer.png'),
            imageHeight: 500,
            imageFit: BoxFit.fitHeight,
          ),
          Layer(
            sensitivity: 12,
            child: Text('Topmost layer'),
          ),
        ]
        child: Text('Page body here'),)
    ,

  }
}

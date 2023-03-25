import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Obx(() => Text(
                  'HomeView is working: ${controller.currentPortfolio.value?.portfolio?.info?.name ?? 'EMPTY'}',
                  style: const TextStyle(fontSize: 20),
                )),
            MaterialButton(
              child: const Text('HomeView is working'),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

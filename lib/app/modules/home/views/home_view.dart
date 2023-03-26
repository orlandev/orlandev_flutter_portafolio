import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 55,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage('https://picsum.photos/id/237/200/300'),
                        ),
                      ),
                      Column(children: const [
                        Text("Orlando N. Rodriguez"),
                      ],)
                    ],
                  ),
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
            )),
      ]),
    );
  }
}

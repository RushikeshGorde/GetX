import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/exmpletwo_counter.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  double opacity = .4;
  ExampleTwoCounterController exampleTwoCounterController = Get.put(ExampleTwoCounterController());
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(children: [
        Obx(
          () => Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 77, 223, 221).withOpacity(exampleTwoCounterController.opacity.value),
          ),
        ),
        Obx(() => Slider(
            value: exampleTwoCounterController.opacity.value,
            onChanged: (Value) {
             exampleTwoCounterController.opacity.value = Value;
            
            })),
      ]),
    );
  }
}

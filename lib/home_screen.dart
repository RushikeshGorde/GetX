import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/counter_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController controller = Get.put(CounterController());
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),

        ),
        body: Center(
          child: Obx((){
            return Text(controller.counter.toString(),style: TextStyle(fontSize: 60),); 
          })
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
        controller.incrementCounter();
        }),
    );
  }
}
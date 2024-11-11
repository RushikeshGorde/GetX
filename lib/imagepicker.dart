import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/imagepicker_controller.dart';

class Imagepicker extends StatefulWidget {
  const Imagepicker({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImagepickerState();
  }
}

class _ImagepickerState extends State<Imagepicker> {
  ImagepickerController controller = Get.put(ImagepickerController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body:Obx( (){
        return Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                       controller.imagePath.isNotEmpty ?
                       FileImage(File(controller.imagePath.toString())) : null 
                    ),
                  ),
                  TextButton(onPressed: (){
                       controller.getImage();
                  }, child: Text('Pick Image'))
                ],
        );
      }

      ) ,
    );
  }
}

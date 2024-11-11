import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/favorite_controller.dart';

// ignore: must_be_immutable
class FavApp extends StatelessWidget {
   FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
      ),
      body: ListView.builder(
        itemCount: controller.fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                if (controller.favList.contains(controller.fruitList[index])) {
                  controller.removeFromFav(controller.fruitList[index]);
                } else {
                  controller.addToFav(controller.fruitList[index]);
                }
              },
              title: Text(controller.fruitList[index]),
              trailing: Obx(
                () => Icon(
                  Icons.favorite,
                  color: controller.favList.contains(controller.fruitList[index])
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

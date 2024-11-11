import 'package:get/get.dart';

class FavoriteController  extends GetxController{
    RxList<String> fruitList = ['Apple', 'Banana', 'Mango', 'Orange', 'Papaya', 'Peach', 'Pineapple', 'Watermelon'].obs;
   RxList favList = [].obs;

  addToFav(String value){
      favList.add(value);
  }
  removeFromFav(String value){
      favList.remove(value);
  }
}
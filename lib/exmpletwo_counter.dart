import 'package:get/get.dart';

class ExampleTwoCounterController extends GetxController {
 RxDouble opacity = .4.obs;

 setOpacity(double value) {
 opacity.value = value;
 }
}
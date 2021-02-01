import 'package:get/get.dart';

class HomeController extends GetxController {
  int navIndex = 0;

  void handleNavigation(int index) {
    this.navIndex = index;
    update();
  }
}

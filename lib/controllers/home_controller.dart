import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt _navIndex = 0.obs;

  void handleNavigation(int index) {
    _navIndex.value = index;
  }

  int get navIndex => _navIndex.value;
}

import 'package:get/get.dart';
import 'package:semantic_kulkul/routes.dart';

class HomeController extends GetxController {
  RxInt _navIndex = 0.obs;

  void handleNavigation(int index) {
    if (index == 2) {
      Get.toNamed(Routes.LoginView);
      return;
    }
    _navIndex.value = index;
  }

  int get navIndex => _navIndex.value;
}

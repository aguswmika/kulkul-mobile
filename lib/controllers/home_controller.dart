import 'package:get/get.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/services/storage_service.dart';

class HomeController extends GetxController {
  RxInt _navIndex = 0.obs;

  void handleNavigation(int index) {
    String token = Get.find<StorageService>().getToken();
    if (index == 2 && (token == null || token.isEmpty)) {
      Get.toNamed(Routes.LoginView);
      return;
    }
    _navIndex.value = index;
  }

  int get navIndex => _navIndex.value;
}

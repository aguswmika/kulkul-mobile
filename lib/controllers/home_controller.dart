import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/user_controller.dart';
import 'package:semantic_kulkul/models/user_model.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/services/storage_service.dart';

class HomeController extends GetxController {
  RxInt _navIndex = 0.obs;

  void handleNavigation(int index) {
    User user = Get.find<UserController>().user.value;
    String token = Get.find<StorageService>().getToken();
    if (index == 2 && (user == null || user.id == null || token == null)) {
      Get.toNamed(Routes.LoginView);
      return;
    }
    _navIndex.value = index;
  }

  int get navIndex => _navIndex.value;
}

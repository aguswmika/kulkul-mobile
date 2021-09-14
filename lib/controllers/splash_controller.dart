import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/user_controller.dart';
import 'package:semantic_kulkul/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    init();
    super.onInit();
  }

  Future<void> init() async {
    await Get.find<UserController>().fetchUser();
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.HomeView);
  }

  Future<void> initServices() async {}
}

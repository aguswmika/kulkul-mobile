import 'package:get/get.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/services/storage_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    init();
    super.onInit();
  }

  Future<void> init() async {
    await initServices();
    String token = Get.find<StorageService>().getToken();
    print(token);
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.HomeView);
  }

  Future<void> initServices() async {
    await Get.putAsync(() => StorageService().init());
  }
}

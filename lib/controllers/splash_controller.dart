import 'package:get/get.dart';
import 'package:semantic_kulkul/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // await Future.wait([
    //   exploreController.fetchKulkul('desa'),
    //   exploreController.fetchKulkul('banjar'),
    //   exploreController.fetchKulkul('puraDesa'),
    //   exploreController.fetchKulkul('puraPuseh'),
    //   exploreController.fetchKulkul('puraDalem'),
    //   exploreController.fetchKulkulByCategory()
    // ]);
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.offNamed(Routes.HomeView);
    });
    super.onInit();
  }
}

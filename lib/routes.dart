import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/category_controller.dart';
import 'package:semantic_kulkul/controllers/desa_controller.dart';
import 'package:semantic_kulkul/controllers/explore_controller.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/controllers/splash_controller.dart';
import 'package:semantic_kulkul/views/desa/desa_view.dart';
import 'package:semantic_kulkul/views/home/home_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_desa_detail_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_banjar_detail_view.dart';
import 'package:semantic_kulkul/views/splash/splash_view.dart';

abstract class AppRoute {
  static const HomeView = '/';
  static const SplashView = '/splash';
  static const KulkulDesaDetailView = '/kulkul-desa-detail';
  static const KulkulBanjarDetailView = '/kulkul-banjar-detail';
  static const DesaView = '/desa';
}

class Routes {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.HomeView, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: AppRoute.SplashView, page: () => SplashView(), binding: SplashBinding()),
    GetPage(name: AppRoute.KulkulBanjarDetailView, page: ()=> KulkulBanjarDetailView(), binding: KulkulBinding()),
    GetPage(name: AppRoute.KulkulDesaDetailView, page: ()=> KulkulDesaDetailView(), binding: KulkulBinding()),
    GetPage(name: AppRoute.DesaView, page: ()=> DesaView(), binding: DesaBinding()),
  ];
}

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ExploreController(), permanent: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
  }
}

class KulkulBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KulkulController());
  }
}

class DesaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DesaController());
  }
}
import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/category_controller.dart';
import 'package:semantic_kulkul/controllers/explore_controller.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/controllers/splash_controller.dart';
import 'package:semantic_kulkul/views/home/home_view.dart';
import 'package:semantic_kulkul/views/kulkul/detail_view.dart';
import 'package:semantic_kulkul/views/splash/splash_view.dart';

abstract class AppRoute {
  static const HomeView = '/';
  static const SplashView = '/splash';
  static const KulkulDetailView = '/kulkul-detail';
}

class Routes {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.HomeView, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: AppRoute.SplashView, page: () => SplashView(), binding: SplashBinding()),
    GetPage(name: AppRoute.KulkulDetailView, page: ()=> KulkulDetailView(), binding: KulkulBinding())
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
    Get.put(KulkulController());
  }
}

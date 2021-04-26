import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/category_controller.dart';
import 'package:semantic_kulkul/controllers/desa_controller.dart';
import 'package:semantic_kulkul/controllers/explore_controller.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/controllers/search_controller.dart';
import 'package:semantic_kulkul/controllers/splash_controller.dart';
import 'package:semantic_kulkul/views/desa/desa_view.dart';
import 'package:semantic_kulkul/views/home/home_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_desa_detail_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_banjar_detail_view.dart';
import 'package:semantic_kulkul/views/search/search_view.dart';
import 'package:semantic_kulkul/views/splash/splash_view.dart';

abstract class Routes {
  static const HomeView = '/';
  static const SplashView = '/splash';
  static const KulkulDesaDetailView = '/kulkul-desa-detail';
  static const KulkulBanjarDetailView = '/kulkul-banjar-detail';
  static const DesaView = '/desa';
  static const SearchView = '/search';
}

class Pages {
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.HomeView, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: Routes.SplashView,
        page: () => SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.KulkulBanjarDetailView,
        page: () => KulkulBanjarDetailView(),
        binding: KulkulBinding()),
    GetPage(
        name: Routes.KulkulDesaDetailView,
        page: () => KulkulDesaDetailView(),
        binding: KulkulBinding()),
    GetPage(
        name: Routes.DesaView, page: () => DesaView(), binding: DesaBinding()),
    GetPage(
        name: Routes.DesaView, page: () => DesaView(), binding: DesaBinding()),
        GetPage(
        name: Routes.SearchView, page: () => SearchView(), binding: SearchBinding()),
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
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExploreController(), fenix: true);
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
    Get.lazyPut(() => DesaController());
  }
}

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
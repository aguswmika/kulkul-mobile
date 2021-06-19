import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/category_controller.dart';
import 'package:semantic_kulkul/controllers/desa_controller.dart';
import 'package:semantic_kulkul/controllers/explore_controller.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/controllers/populate_controller.dart';
import 'package:semantic_kulkul/controllers/search_controller.dart';
import 'package:semantic_kulkul/controllers/splash_controller.dart';
import 'package:semantic_kulkul/controllers/user_controller.dart';
import 'package:semantic_kulkul/services/storage_service.dart';
import 'package:semantic_kulkul/views/desa/desa_pura_view.dart';
import 'package:semantic_kulkul/views/desa/desa_view.dart';
import 'package:semantic_kulkul/views/explore/explore_pura_view.dart';
import 'package:semantic_kulkul/views/home/home_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_desa_detail_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_banjar_detail_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_pura_detail_view.dart';
import 'package:semantic_kulkul/views/kulkul/kulkul_view.dart';
import 'package:semantic_kulkul/views/populate/populate_kulkul_view.dart';
import 'package:semantic_kulkul/views/populate/populate_view.dart';
import 'package:semantic_kulkul/views/search/search_view.dart';
import 'package:semantic_kulkul/views/splash/splash_view.dart';
import 'package:semantic_kulkul/views/user/login_view.dart';

abstract class Routes {
  static const HomeView = '/';
  static const ExplorePuraView = '/pura';
  static const SplashView = '/splash';
  static const KulkulView = '/kulkul';
  static const KulkulDesaDetailView = '/kulkul/desa/detail';
  static const KulkulBanjarDetailView = '/kulkul/banjar/detail';
  static const KulkulPuraDetailView = '/kulkul/pura/detail';
  static const DesaView = '/desa';
  static const DesaPuraView = '/desa/pura';
  static const SearchView = '/search';
  static const LoginView = '/login';
  static const PopulateView = '/populate';
  static const PopulateKulkulView = '/populate/kulkul';
}

class Pages {
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.HomeView, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: Routes.ExplorePuraView,
        page: () => ExplorePuraView(),
        binding: ExploreBinding()),
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
        name: Routes.KulkulPuraDetailView,
        page: () => KulkulPuraDetailView(),
        binding: KulkulBinding()),
    GetPage(
        name: Routes.KulkulView,
        page: () => KulkulView(),
        binding: KulkulBinding()),
    GetPage(
        name: Routes.DesaView, page: () => DesaView(), binding: DesaBinding()),
    GetPage(
        name: Routes.DesaPuraView,
        page: () => DesaPuraView(),
        binding: DesaBinding()),
    GetPage(
        name: Routes.DesaView, page: () => DesaView(), binding: DesaBinding()),
    GetPage(
        name: Routes.SearchView,
        page: () => SearchView(),
        binding: SearchBinding()),
    GetPage(
        name: Routes.LoginView,
        page: () => LoginView(),
        binding: UserBinding()),
    GetPage(
        name: Routes.PopulateView,
        page: () => PopulateView(),
        binding: PopulateBinding()),
        GetPage(
        name: Routes.PopulateKulkulView,
        page: () => PopulateKulkulView(),
        binding: PopulateBinding()),
  ];
}

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.putAsync(() => StorageService().init()).then((value) {
      Get.put(UserController(), permanent: true);
      Get.put(SplashController());
    });
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExploreController(), fenix: true);
    Get.lazyPut(() => CategoryController());
    // Get.lazyPut(() => UserController());
  }
}

class ExploreBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => ExploreController(), fenix: true);
  }
}

class KulkulBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KulkulController(), fenix: true);
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

class UserBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(UserController());
  }
}

class PopulateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopulateController());
  }
}

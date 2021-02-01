import 'package:get/route_manager.dart';
import 'package:semantic_kulkul/views/explore/explore_view.dart';
import 'package:semantic_kulkul/views/home/home_view.dart';
import 'package:semantic_kulkul/views/kategori/kategori_view.dart';
import 'package:semantic_kulkul/views/splash/splash_view.dart';

abstract class AppRoute {
  static const HomeView = '/';
  static const SplashView = '/splash';
  static const ExploreView = '/explore';
  // static const KategoriView = '/kategori';
}

class Routes {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.HomeView, page: () => HomeView()),
    GetPage(name: AppRoute.ExploreView, page: () => ExploreView()),
    // // GetPage(name: AppRoute.KategoriView, page: () => KategoriView()),
  ];
}

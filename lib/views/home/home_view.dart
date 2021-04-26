import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/views/category/category_view.dart';
import 'package:semantic_kulkul/views/explore/explore_view.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> _routes = [
    ExploreView(),
    CategoryView(),
    Container(),
  ];
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Obx(
          () => Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.navIndex,
              selectedItemColor: ColorHelper.blueColor,
              onTap: (index) => controller.handleNavigation(index),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Jelajahi',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Kategori',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Pengguna',
                ),
              ],
            ),
            body: Container(color: ColorHelper.whiteColor , child: _routes[controller.navIndex]),
          ),
        ));
  }
}

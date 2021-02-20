import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/views/category/category_view.dart';
import 'package:semantic_kulkul/views/explore/explore_view.dart';

class HomeView extends StatelessWidget {
  final List<Widget> _routes = [
    ExploreView(),
    CategoryView(),
    Container(),
  ];
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => Scaffold(
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
            // backgroundColor: ColorHelper.whi teColor,
            body: SafeArea(child: _routes[controller.navIndex]),
          ),
        ));
  }
}

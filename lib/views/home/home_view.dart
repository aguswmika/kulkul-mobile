import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:semantic_kulkul/controllers/home_controller.dart';
import 'package:semantic_kulkul/views/explore/explore_view.dart';
import 'package:semantic_kulkul/views/kategori/kategori_view.dart';

class HomeView extends StatelessWidget {
  final List<Widget> _routes = [
    ExploreView(),
    KategoriView(),
    ExploreView(),
  ];
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => Scaffold(
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: ColorHelper.blueColor,
            // title: Center(
            //     child: Text(
            //   'Semantic Kulkul',
            //   style: TextStyle(
            //       fontFamily: 'Roboto',
            //       fontSize: Heading.h2,
            //       color: ColorHelper.whiteColor),
            // )),
            // ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.navIndex,
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

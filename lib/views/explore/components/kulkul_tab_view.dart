import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/explore_controller.dart';
import 'package:semantic_kulkul/views/explore/components/kulkul_component.dart';

class KulkulTabView extends StatelessWidget {
  // final ExploreController controller = Get.find();
  final TabController tabController;

  KulkulTabView({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
      builder: (controller) =>
          TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: this.tabController,
        children: [
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: ResponsiveFlutter.of(context).scale(0.55),
              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(2.5), vertical: ResponsiveFlutter.of(context).wp(5)),
              crossAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              mainAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              children:
                  List.generate(controller.getKulkulList('desa').length, (index) {
                return KulkulComponent(data: controller.getKulkulList('desa')[index]);
              })),
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: ResponsiveFlutter.of(context).scale(0.55),
              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(2.5), vertical: ResponsiveFlutter.of(context).wp(5)),
              crossAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              mainAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              children:
                  List.generate(controller.getKulkulList('banjar').length, (index) {
                return KulkulComponent(data: controller.getKulkulList('banjar')[index]);
              })),
          // Icon(Icons.directions_transit),
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: ResponsiveFlutter.of(context).scale(0.55),
              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(2.5), vertical: ResponsiveFlutter.of(context).wp(5)),
              crossAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              mainAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              children:
                  List.generate(controller.getKulkulList('puraDesa').length, (index) {
                return KulkulComponent(data: controller.getKulkulList('puraDesa')[index]);
              })),
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: ResponsiveFlutter.of(context).scale(0.55),
              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(2.5), vertical: ResponsiveFlutter.of(context).wp(5)),
              crossAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              mainAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              children:
                  List.generate(controller.getKulkulList('puraPuseh').length, (index) {
                return KulkulComponent(data: controller.getKulkulList('puraPuseh')[index]);
              })),
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: ResponsiveFlutter.of(context).scale(0.55),
              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(2.5), vertical: ResponsiveFlutter.of(context).wp(5)),
              crossAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              mainAxisSpacing: ResponsiveFlutter.of(context).wp(5),
              children:
                  List.generate(controller.getKulkulList('puraDalem').length, (index) {
                return KulkulComponent(data: controller.getKulkulList('puraDalem')[index]);
              })),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/desa_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/explore/components/location_component.dart';

class DesaView extends GetView<DesaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          title: Text(
            Get.parameters['title'],
            style: TextStyle(color: ColorHelper.blackColor),
          ),
          backgroundColor: ColorHelper.whiteColor,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: ColorHelper.blackColor, //change your color here
          ),
        ),
        body: Obx(() => controller.loading
            ? LoadingComponent()
            : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                      top: index == 0 ? ResponsiveFlutter.of(context).wp(5) : 0.0,
                      bottom: ResponsiveFlutter.of(context).wp(5),
                      left: ResponsiveFlutter.of(context).wp(5),
                      right: ResponsiveFlutter.of(context).wp(5)),
                  child: LocationComponent(
                    onTap: () {
                      Get.toNamed(Routes.KulkulDesaDetailView,
                          parameters: {
                            'id': controller.desas[index].id,
                            'title': controller.desas[index].name
                          });
                    },
                    height: ResponsiveFlutter.of(context).wp(20),
                    title: controller.desas[index].name,
                    image: controller.desas[index].image,
                  ),
                );
              },
              itemCount: controller.desas.length,
            )));
  }
}

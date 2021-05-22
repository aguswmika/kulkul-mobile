import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/explore_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/explore/components/location_component.dart';

class ExplorePuraView extends GetView<ExploreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.whiteColor,
        appBar: AppBar(
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
        body: GetX(
          initState: (_) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => controller.fetchPuraLocations());
          },
          builder: (_) => controller.loadingPura
              ? LoadingComponent()
              : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: ResponsiveFlutter.of(context).wp(3)),
                  itemBuilder: (BuildContext context, int index) {
                    return controller.puraLocations[index].kecamatan != null && controller.puraLocations[index].kecamatan.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveFlutter.of(context).wp(5)),
                                child: Text(
                                  controller.puraLocations[index].name,
                                  style: TextStyle(
                                      fontSize: Heading.h3,
                                      color: ColorHelper.blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                height: ResponsiveFlutter.of(context).hp(15),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return Container(
                                      width:
                                          ResponsiveFlutter.of(context).wp(60),
                                      margin: EdgeInsets.only(
                                          left: index2 == 0
                                              ? ResponsiveFlutter.of(context)
                                                  .wp(4)
                                              : 0,
                                          right: ResponsiveFlutter.of(context)
                                              .wp(4),
                                          bottom: ResponsiveFlutter.of(context)
                                              .wp(4),
                                          top: ResponsiveFlutter.of(context)
                                              .wp(4)),
                                      child: LocationComponent(
                                          onTap: () {
                                            Get.toNamed(Routes.DesaView,
                                                parameters: {
                                                  'id': controller
                                                      .locations[index]
                                                      .kecamatan[index2]
                                                      .id,
                                                  'title': controller
                                                      .locations[index]
                                                      .kecamatan[index2]
                                                      .name,
                                                });
                                          },
                                          title: controller.puraLocations[index]
                                              .kecamatan[index2].name,
                                          image: controller.puraLocations[index]
                                              .kecamatan[index2].image),
                                    );
                                  },
                                  itemCount: controller
                                      .locations[index].kecamatan.length,
                                ),
                              )
                            ],
                          )
                        : Container();
                  },
                  itemCount: controller.puraLocations.length,
                ),
        ));
  }
}

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

class ExploreView extends GetView<ExploreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  pinned: false,
                  elevation: 0,
                  centerTitle: false,
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: ColorHelper.blackColor,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.SearchView);
                      },
                      tooltip: 'Search',
                    )
                  ],
                  title: Text('Jelajahi Kulkul',
                      style: TextStyle(color: ColorHelper.blackColor)),
                  // flexibleSpace: FlexibleSpaceBar(title: Text('Jao'), background: ,),
                  backgroundColor: Colors.transparent)
            ];
          },
          body: GetX<ExploreController>(
            initState: (_){
              WidgetsBinding.instance.addPostFrameCallback(
              (_) =>
              controller.fetchLocations());
            },
            builder: (_) => controller.loading
                ? LoadingComponent()
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchLocations();
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return controller.locations[index].kecamatan.length > 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ResponsiveFlutter.of(context)
                                                .wp(5)),
                                    child: Text(
                                      controller.locations[index].name,
                                      style: TextStyle(
                                          fontSize: Heading.h3,
                                          color: ColorHelper.blackColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        ResponsiveFlutter.of(context).hp(15),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index2) {
                                        return Container(
                                          width: ResponsiveFlutter.of(context)
                                              .wp(60),
                                          margin: EdgeInsets.only(
                                              left: index2 == 0
                                                  ? ResponsiveFlutter.of(
                                                          context)
                                                      .wp(4)
                                                  : 0.0,
                                              right:
                                                  ResponsiveFlutter.of(context)
                                                      .wp(4),
                                              bottom:
                                                  ResponsiveFlutter.of(context)
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
                                              title: controller.locations[index]
                                                  .kecamatan[index2].name,
                                              image: controller.locations[index]
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
                      itemCount: controller.locations.length,
                    ),
                  ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/models/location_model.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/components/text_button_component.dart';

class KulkulView extends GetView<KulkulController> {
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
        body: GetX<KulkulController>(
            initState: (state) {
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  controller.fetchLocationById(
                      Get.parameters['type'], Get.parameters['id']));
            },
            builder: (_) => controller.loadingLocation
                ? LoadingComponent()
                : controller.locations != null &&
                        controller.locations.isNotEmpty
                    ? SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: ResponsiveFlutter.of(context).wp(3)),
                        child: LocationListComponent(
                            locations: controller.locations),
                      ),
                    )
                    : Center(
                        child: Text('Tidak ada data'),
                      )));
  }
}

class LocationListComponent extends StatelessWidget {
  LocationListComponent({
    Key key,
    @required this.locations,
  }) : super(key: key);

  final List<LocationList> locations;

  String parsePura(String data) {
    String result;
    result = data.replaceAll('Pura Desa', '');
    result = result.replaceAll('Pura Puseh', '');
    result = result.replaceAll('Pura Dalem', '');
    return 'Pura Khayangan Tiga'+result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: locations
            .map((element) => Container(
                  padding: EdgeInsets.only(
                      left: ResponsiveFlutter.of(context).wp(2),
                      right: ResponsiveFlutter.of(context).wp(2),
                      bottom: ResponsiveFlutter.of(context).wp(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            bottom: ResponsiveFlutter.of(context).wp(2)),
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: ResponsiveFlutter.of(context).wp(2)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorHelper.lightBlueColor,
                                      width: 4))),
                          child: Text(
                            element.title,
                            style: TextStyle(fontSize: Heading.h2),
                          ),
                        ),
                      ),
                      ...element.kabupaten
                          .map((e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title,
                                    style: TextStyle(
                                        fontSize: Heading.h3,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SeparatorComponent(
                                    height: 2,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                ResponsiveFlutter.of(context)
                                                    .wp(1)),
                                        child: TextButtonComponent(
                                            onTap: () {
                                              Get.toNamed(
                                                  e.kulkulList[index].type ==
                                                          'Desa'
                                                      ? Routes
                                                          .KulkulDesaDetailView
                                                      : (e.kulkulList[index]
                                                                  .type ==
                                                              'Banjar'
                                                          ? Routes
                                                              .KulkulBanjarDetailView
                                                          : (e.kulkulList[index]
                                                                  .type ==
                                                              'Pura' ? Routes
                                                              .KulkulPuraDetailView : Routes
                                                              .DesaView)),
                                                  parameters: {
                                                    'id':
                                                        e.kulkulList[index].id,
                                                    'title': e.kulkulList[index]
                                                                .type !=
                                                            'Pura'
                                                        ? e.kulkulList[index]
                                                            .value
                                                        : parsePura(e
                                                            .kulkulList[index]
                                                            .value)
                                                  });
                                            },
                                            child: Text(
                                                e.kulkulList[index].value)),
                                      );
                                    },
                                    itemCount: e.kulkulList.length,
                                  ),
                                  SeparatorComponent(
                                    height: 4,
                                  )
                                ],
                              ))
                          .toList()
                    ],
                  ),
                ))
            .toList());
  }
}

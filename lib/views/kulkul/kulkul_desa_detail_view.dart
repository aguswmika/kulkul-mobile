import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/explore/components/location_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_caption_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_detail_component.dart';

class KulkulDesaDetailView extends GetView<KulkulController> {
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
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => controller.fetchKulkulDesa(Get.parameters['id']));
        },
        builder: (_) => _.loading
            ? Container(child: LoadingComponent())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _.kulkulDesa.value.kulkul != null
                        ? KulkulDetailComponent(
                            kulkul: _.kulkulDesa.value.kulkul,
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context).wp(6),
                                bottom: ResponsiveFlutter.of(context).wp(3)),
                            child: Text('Data Kulkul Desa tidak tersedia')),
                    _.kulkulDesa.value.banjars.length > 0
                        ? Padding(
                            padding: EdgeInsets.only(
                                left:
                                    ResponsiveFlutter.of(context).wp(5),
                                    right: 
                                    ResponsiveFlutter.of(context).wp(5), bottom: ResponsiveFlutter.of(context).wp(6)),
                            child: KulkulCaptionComponent(
                                title: 'Banjar Yang Dimiliki',
                                bottom: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _.kulkulDesa.value.banjars
                                      .map((e) => Container(
                                            margin: EdgeInsets.only(
                                                bottom: ResponsiveFlutter.of(
                                                        context)
                                                    .wp(3)),
                                            child: LocationComponent(
                                              height:
                                                  ResponsiveFlutter.of(context)
                                                      .hp(10),
                                              image: e.image,
                                              title: e.name,
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes
                                                        .KulkulBanjarDetailView,
                                                    parameters: {
                                                      'id': e.id,
                                                      'title': e.name
                                                    });
                                              },
                                            ),
                                          ))
                                      .toList(),
                                )),
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context).wp(6),
                                bottom: ResponsiveFlutter.of(context).wp(12)),
                            child: Text('Data Banjar tidak tersedia')),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_detail_component.dart';

class KulkulBanjarDetailView extends GetView<KulkulController> {
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
              (_) => controller.fetchKulkulBanjar(Get.parameters['id']));
        },
        builder: (_) => _.loadingKulkulBanjar
            ? Container(child: LoadingComponent())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _.kulkulBanjar.value != null
                        ? KulkulDetailComponent(
                            kulkul: _.kulkulBanjar.value,
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context).wp(6),
                                bottom: ResponsiveFlutter.of(context).wp(6)),
                            child: Text('Data Kulkul Banjar tidak tersedia')),
                  ],
                ),
              ),
      ),
    );
  }
}

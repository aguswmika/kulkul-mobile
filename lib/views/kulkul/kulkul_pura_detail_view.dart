import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_detail_component.dart';

class KulkulPuraDetailView extends GetView<KulkulController> {
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
              (_) => controller.fetchKulkulPura(Get.parameters['id']));
        },
        builder: (_) => _.loadingKulkulPura
            ? Container(child: LoadingComponent())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SeparatorComponent(
                      height: 5,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(10)),
                        child: Text(
                          Get.parameters['title'],
                          style: TextStyle(
                              color: ColorHelper.darkBlueColor,
                              fontSize: Heading.h2,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        )),
                        SeparatorComponent(
                      height: 1.5,
                    ),
                        Center(
                          child: Container(
                            width: ResponsiveFlutter.of(context).wp(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: ColorHelper.lightBlueColor,
                                        width: 4)))),
                        ),
                    _.kulkulPura.value != null &&
                            _.kulkulPura.value.puraDesa != null
                        ? KulkulDetailComponent(
                            kulkul: _.kulkulPura.value.puraDesa,
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context).wp(6),
                                bottom: ResponsiveFlutter.of(context).wp(6)),
                            child: Text('Data Kulkul Pura Desa tidak tersedia')),
                    _.kulkulPura.value != null &&
                            _.kulkulPura.value.puraPuseh != null
                        ? KulkulDetailComponent(
                            kulkul: _.kulkulPura.value.puraPuseh,
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context).wp(6),
                                bottom: ResponsiveFlutter.of(context).wp(6)),
                            child: Text('Data Kulkul Pura Puseh tidak tersedia')),
                    _.kulkulPura.value != null &&
                            _.kulkulPura.value.puraDalem != null
                        ? KulkulDetailComponent(
                            kulkul: _.kulkulPura.value.puraDalem,
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context).wp(6),
                                bottom: ResponsiveFlutter.of(context).wp(6)),
                            child: Text('Data Kulkul Pura Dalem tidak tersedia')),
                  ],
                ),
              ),
      ),
    );
  }
}

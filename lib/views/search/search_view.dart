import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/search_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';

class SearchView extends GetView<SearchController> {
  String parsePura(String data) {
    String result;
    result = data.replaceAll('Pura Desa', '');
    result = result.replaceAll('Pura Puseh', '');
    result = result.replaceAll('Pura Dalem', '');
    return 'Pura Khayangan Tiga'+result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Pencarian', style: TextStyle(color: ColorHelper.blackColor)),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorHelper.blackColor, //change your color here
        ),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.loading
            ? Center(
                child: LoadingComponent(),
              )
            : controller.search.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(
                      left: ResponsiveFlutter.of(context).wp(5),
                      right: ResponsiveFlutter.of(context).wp(5),
                    ),
                    child: ListView(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                      top: index == 0
                                          ? ResponsiveFlutter.of(context).wp(6)
                                          : 0,
                                      bottom:
                                          ResponsiveFlutter.of(context).wp(6)),
                                  child: InkWell(
                                    onTap: () {
                                      if (controller.selectedOutput.value !=
                                          'lokasi') {
                                        Get.toNamed(Routes.KulkulView,
                                            parameters: {
                                              'id': controller.search[index].id,
                                              'type': controller
                                                  .selectedOutput.value == 'aktivitas' ? 'kegiatan' : controller
                                                  .selectedOutput.value,
                                              'title':
                                                  '${controller.selectedOutput.value.split('_').join(' ').capitalize} - ${controller.search[index].value}',
                                            });
                                      } else {
                                        String kulkulTipe = controller
                                            .search[index].value
                                            .split(' ')[0];
                                        Get.toNamed(
                                            kulkulTipe == 'Desa'
                                                ? Routes.KulkulDesaDetailView
                                                : (kulkulTipe == 'Banjar'
                                                    ? Routes
                                                        .KulkulBanjarDetailView
                                                    : Routes
                                                        .KulkulPuraDetailView),
                                            parameters: {
                                              'id': controller.search[index].id,
                                              'title':
                                                  '${kulkulTipe == 'Desa' || kulkulTipe == 'Banjar' ? controller.search[index].value : parsePura(controller.search[index].value)}'
                                            });
                                      }
                                    },
                                    child: Text(
                                      '${(index + 1)}. ${controller.search[index].value}',
                                      style: TextStyle(
                                          fontSize: Heading.h4,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                            itemCount: controller.search.length),
                        Container(
                            padding: EdgeInsets.all(
                                ResponsiveFlutter.of(context).wp(5)),
                            margin: EdgeInsets.only(
                                bottom: ResponsiveFlutter.of(context).hp(12)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ResponsiveFlutter.of(context).wp(5)),
                                color: ColorHelper.lightBlueColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Query :',
                                    style: TextStyle(
                                        color: ColorHelper.blackColor,
                                        fontSize: Heading.h3,
                                        fontWeight: FontWeight.w600)),
                                SeparatorComponent(
                                  height: 4,
                                ),
                                Text(
                                  '${controller.query.value}',
                                  style: TextStyle(
                                      color: ColorHelper.blackColor,
                                      fontSize: Heading.h4),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        left: ResponsiveFlutter.of(context).wp(5),
                        right: ResponsiveFlutter.of(context).wp(5),
                        top: ResponsiveFlutter.of(context).wp(6)),
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apa yang ingin Anda cari?',
                              style: TextStyle(
                                  color: ColorHelper.blackColor,
                                  fontSize: Heading.h3,
                                  fontWeight: FontWeight.w500),
                            ),
                            SeparatorComponent(
                              height: 4,
                            ),
                            DropdownButtonFormField(
                                value: controller.selectedOutput.value,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Output belum dipilih';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveFlutter.of(context).wp(8),
                                  ),
                                  fillColor: ColorHelper.lightGrayColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ResponsiveFlutter.of(context)
                                                  .wp(4)))),
                                ),
                                elevation: 0,
                                onChanged: controller.handleOutput,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('--- Pilih ---'),
                                    value: '',
                                  ),
                                  ...controller.outputs
                                      .map(
                                        (item) => DropdownMenuItem(
                                          child: Text(item.value ?? '-'),
                                          value: item.id,
                                        ),
                                      )
                                      .toList()
                                ]),
                            SeparatorComponent(
                              height: 5,
                            ),
                            controller.selectedOutput.value.isNotEmpty
                                ? Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pilih kategori dari yang ingin Anda cari',
                                          style: TextStyle(
                                              color: ColorHelper.blackColor,
                                              fontSize: Heading.h3,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SeparatorComponent(
                                          height: 2,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(
                                                    '${controller.filters[index].label}'),
                                                value: controller
                                                    .filters[index].status,
                                                onChanged: (bool value) {
                                                  controller.handleFilter(
                                                      value, index);
                                                },
                                              );
                                            },
                                            itemCount:
                                                controller.filters.length,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        )),
                  ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
            onPressed: controller.handleSearch,
            backgroundColor: controller.search.isNotEmpty
                ? ColorHelper.redColor
                : ColorHelper.blueColor,
            icon: Icon(
                controller.search.isNotEmpty ? Icons.restore : Icons.search),
            label: Text(controller.search.isNotEmpty ? 'Reset' : 'Cari')),
      ),
    );
  }
}

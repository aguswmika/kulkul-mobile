import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/populate_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/elevated_button_component.dart';
import 'package:semantic_kulkul/views/components/loading_component.dart';
import 'package:semantic_kulkul/views/components/select_form_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/components/text_form_component.dart';

class PopulateView extends GetView<PopulateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kulkul',
            style: TextStyle(color: ColorHelper.blackColor)),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorHelper.blackColor, //change your color here
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
              child: GetX<PopulateController>(
            initState: (_) {
              controller.fetchAllKabupaten().then((value) {
                controller.fetchAllDimension();
                controller.fetchAllDirection();
                controller.fetchAllActivity();
              });
            },
            builder: (_) => controller.loading.value
                ? LoadingComponent()
                : SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: ResponsiveFlutter.of(context).wp(5),
                          left: ResponsiveFlutter.of(context).wp(5),
                          right: ResponsiveFlutter.of(context).wp(5)),
                      child: Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kabupaten',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          SelectFormComponent(
                            value: controller.kabupaten.value,
                            onChange: controller.handleSelectKabupaten,
                            data: controller.kabupatens,
                          ),
                          SeparatorComponent(
                            height: 3,
                          ),
                          Text(
                            'Kecamatan',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          SelectFormComponent(
                            value: controller.kecamatan.value,
                            onChange: controller.handleSelectKecamatan,
                            data: controller.kecamatans,
                          ),
                          SeparatorComponent(
                            height: 3,
                          ),
                          Text(
                            'Desa Adat',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          TextFormComponent(
                            hintText: 'cont. Desa Adat Dalung',
                            onChanged: controller.handleEditDesa,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: ResponsiveFlutter.of(context).wp(100)),
                              child: ElevatedButtonComponent(
                                  onPressed: () {
                                    Get.toNamed(Routes.PopulateKulkulView,
                                        parameters: {'id': 'desa'});
                                  },
                                  child: Text('Tambah Detail Kulkul Desa Adat'))),
                          SeparatorComponent(
                            height: 3,
                          ),
                          Text(
                            'Banjar Adat',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          TextFormComponent(
                            hintText: 'cont. Banjar Adat Dalung',
                            onChanged: controller.handleEditBanjar,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: ResponsiveFlutter.of(context).wp(100)),
                              child: ElevatedButtonComponent(
                                  onPressed: () {
                                    Get.toNamed(Routes.PopulateKulkulView,
                                        parameters: {'id': 'banjar'});
                                  },
                                  child:
                                      Text('Tambah Detail Kulkul Banjar Adat'))),
                          SeparatorComponent(
                            height: 3,
                          ),
                          Text(
                            'Pura Desa',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          TextFormComponent(
                            controller: controller.puraDesaController,
                            hintText: 'cont. Pura Desa Desa Adat Dalung',
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: ResponsiveFlutter.of(context).wp(100)),
                              child: ElevatedButtonComponent(
                                  onPressed: () {
                                    Get.toNamed(Routes.PopulateKulkulView,
                                        parameters: {'id': 'puraDesa'});
                                  },
                                  child: Text('Tambah Detail Kulkul Pura Desa'))),
                          SeparatorComponent(
                            height: 3,
                          ),
                          Text(
                            'Pura Puseh',
                            style: TextStyle(
                                color: ColorHelper.grayColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SeparatorComponent(
                            height: 2,
                          ),
                          TextFormComponent(
                            controller: controller.puraPusehController,
                            hintText: 'cont. Pura Puseh Desa Adat Dalung',
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: ResponsiveFlutter.of(context).wp(100)),
                              child: ElevatedButtonComponent(
                                  onPressed: () {
                                    Get.toNamed(Routes.PopulateKulkulView,
                                        parameters: {'id': 'puraPuseh'});
                                  },
                                  child:
                                      Text('Tambah Detail Kulkul Pura Puseh'))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pura Dalem',
                                style: TextStyle(
                                    color: ColorHelper.grayColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.blue),
                                onPressed: controller.handleButtonPuraDalem,
                                color: Colors.blue,
                                iconSize: Heading.h1,
                              )
                            ],
                          ),
                          TextFormComponent(
                            controller: controller.puraDalemController,
                            hintText: 'cont. Pura Dalem Desa Adat Dalung',
                          ),
                          SeparatorComponent(height: 2,),
                          controller.puraDalem != null && controller.puraDalem.isNotEmpty ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(controller.puraDalem.length, (index) => Padding(
                              padding: EdgeInsets.only(bottom: ResponsiveFlutter.of(context).wp(2)),
                              child: TextFormComponent(
                              initialValue: controller.puraDalem[index],
                              onChanged: (String value) => controller.handleEditPuraDalem(index, value),
                              hintText: 'cont. Pura Dalem Desa Adat Dalung',
                          ),
                            ))) : Container(),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: ResponsiveFlutter.of(context).wp(100)),
                            child: ElevatedButtonComponent(
                                onPressed: () {
                                  Get.toNamed(Routes.PopulateKulkulView,
                                      parameters: {'id': 'puraDalem'});
                                },
                                child: Text('Tambah Detail Kulkul Pura Dalem')),
                          ),
                          SeparatorComponent(
                            height: 5,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: ResponsiveFlutter.of(context).wp(100),
                                  height: ResponsiveFlutter.of(context).hp(8)),
                              child: ElevatedButtonComponent(
                                onPressed: () {
                                  controller.saveKulkul();
                                },
                                child: Text('Simpan Data'),
                              )),
                          SeparatorComponent(
                            height: 5,
                          ),
                        ],
                      )),
                    ),
                  )),
      ),
    );
  }
}

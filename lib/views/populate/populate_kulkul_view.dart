import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/controllers/populate_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/views/components/select_form_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/components/text_form_component.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PopulateKulkulView extends GetView<PopulateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Detail Kulkul',
              style: TextStyle(color: ColorHelper.blackColor)),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: ColorHelper.blackColor, //change your color here
          ),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
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
                      'Jumlah',
                      style: TextStyle(
                          color: ColorHelper.grayColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SeparatorComponent(
                      height: 2,
                    ),
                    SelectFormComponent(
                      value: controller.kulkul.value.number,
                      onChange: controller.handleSelectJumlahKulkul,
                      data: [
                        SelectItem(id: '1', value: '1'),
                        SelectItem(id: '2', value: '2'),
                        SelectItem(id: '3', value: '3'),
                        SelectItem(id: '4', value: '4')
                      ],
                    ),
                    SeparatorComponent(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pakaian',
                          style: TextStyle(
                              color: ColorHelper.grayColor,
                              fontWeight: FontWeight.w600),
                        ),
                        ToggleSwitch(
                          initialLabelIndex:
                              controller.kulkul.value.pengangge.lang == 'id'
                                  ? 0
                                  : 1,
                          activeFgColor: Colors.white,
                          inactiveBgColor: ColorHelper.grayColor,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: ['id', 'ban'],
                          onToggle: controller.handleTogglePengangge,
                        ),
                      ],
                    ),
                    SeparatorComponent(
                      height: 2,
                    ),
                    TextFormComponent(
                      hintText: 'cont. Kain Poleng',
                      onChanged: controller.handleEditPengangge,
                    ),
                    SeparatorComponent(
                      height: 3,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          controller.kulkul.value.number.isNotEmpty
                              ? int.parse(controller.kulkul.value.number)
                              : 0,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Bahan Baku (${(index + 1)})',
                                    style: TextStyle(
                                        color: ColorHelper.grayColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  ToggleSwitch(
                                    initialLabelIndex: controller.kulkul.value
                                                .rawMaterials[index].lang ==
                                            'id'
                                        ? 0
                                        : 1,
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: ColorHelper.grayColor,
                                    inactiveFgColor: Colors.white,
                                    totalSwitches: 2,
                                    labels: ['id', 'ban'],
                                    onToggle: (int value) {
                                      controller.handleToggleRawMaterial(
                                          index, value);
                                    },
                                  ),
                                ],
                              ),
                              SeparatorComponent(
                                height: 2,
                              ),
                              TextFormComponent(
                                initialValue: controller.kulkul.value.rawMaterials[index].name,
                                hintText: 'cont. Kayu Jati',
                                onChanged: (String value) {
                                  controller.handleEditRawMaterial(
                                      index, value);
                                },
                              ),
                              SeparatorComponent(
                                height: 3,
                              ),
                              Text(
                                'Ukuran (${(index + 1)})',
                                style: TextStyle(
                                    color: ColorHelper.grayColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SeparatorComponent(
                                height: 2,
                              ),
                              SelectFormComponent(
                                value:
                                    controller.kulkul.value.dimensions[index],
                                onChange: (String value) {
                                  controller.handleSelectDimension(
                                      index, value);
                                },
                                data: controller.dimensions,
                              ),
                              SeparatorComponent(
                                height: 3,
                              ),
                            ],
                          ),
                        ).toList())
                  ]),
            ),
          )),
        ));
  }
}

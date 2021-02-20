import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:semantic_kulkul/controllers/kulkul_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/routes.dart';

class KulkulDetailView extends GetView<KulkulController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: ColorHelper.whiteColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorHelper.blackColor, //change your color here
        ),
      ),
      body: SafeArea(child: RaisedButton(
        child: Text('Halo'),
        onPressed: () {
          Get.toNamed(AppRoute.KulkulDetailView, preventDuplicates: false);
        },
      )),
    );
  }
}

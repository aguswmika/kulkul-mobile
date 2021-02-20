import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/controllers/splash_controller.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';

class SplashView extends GetView<SplashController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.blueColor,
      body: SafeArea(
          child: Center(
        child: Text(
          'Semantic Kulkul',
          style: TextStyle(
              color: ColorHelper.whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: Heading.h1),
        ),
      )),
    );
  }
}

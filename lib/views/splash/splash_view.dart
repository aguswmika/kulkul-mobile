import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/routes/routes.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Get.offNamed(AppRoute.HomeView);
    });
    super.initState();
  }

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

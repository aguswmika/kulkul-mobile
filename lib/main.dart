import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Semantic Kulkul',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      initialRoute: AppRoute.SplashView,
      defaultTransition: Transition.cupertino,
      getPages: Routes.pages
    );
  }
}
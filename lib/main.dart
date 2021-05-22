import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/routes.dart';

void main() {
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  AudioPlayer.logEnabled = true;
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
      initialRoute: Routes.SplashView,
      defaultTransition: Transition.cupertino,
      getPages: Pages.pages,
      builder: EasyLoading.init(),
    );
  }
}
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

abstract class Heading {
  static double h1 = ResponsiveFlutter.of(Get.context).fontSize(3.5);
  static double h2 = ResponsiveFlutter.of(Get.context).fontSize(2.8);
  static double h3 = ResponsiveFlutter.of(Get.context).fontSize(2.2);
  static double h4 = ResponsiveFlutter.of(Get.context).fontSize(2);
  static double h5 = ResponsiveFlutter.of(Get.context).fontSize(1.5);
}

abstract class Caption {
  static double c1 = ResponsiveFlutter.of(Get.context).fontSize(1.2);
  static double c2 = ResponsiveFlutter.of(Get.context).fontSize(1);
}

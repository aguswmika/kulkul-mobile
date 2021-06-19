import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class SnackbarHelper {
  static void error(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ColorHelper.redColor, colorText: ColorHelper.whiteColor, snackPosition: SnackPosition.TOP);
  }

  static void info(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ColorHelper.blueColor, colorText: ColorHelper.whiteColor, snackPosition: SnackPosition.TOP);
  }

  static void success(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ColorHelper.greenColor, colorText: ColorHelper.whiteColor, snackPosition: SnackPosition.TOP);
  }

  static void warning(String title, String message) {
    Get.snackbar(title, message, backgroundColor: Colors.orange[400], colorText: ColorHelper.blackColor, snackPosition: SnackPosition.TOP);
  }
}

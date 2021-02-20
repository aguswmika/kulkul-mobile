import 'package:get/get.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class SnackbarHelper {
  static void error(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ColorHelper.redColor, colorText: ColorHelper.whiteColor, snackPosition: SnackPosition.BOTTOM);
  }

  static void info(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ColorHelper.blueColor, colorText: ColorHelper.whiteColor, snackPosition: SnackPosition.BOTTOM);
  }

  static void success(String title, String message) {
    Get.snackbar(title, message, backgroundColor: ColorHelper.greenColor, colorText: ColorHelper.whiteColor, snackPosition: SnackPosition.BOTTOM);
  }
}

import 'dart:io';
import 'package:flutter/material.dart';

abstract class ColorHelper {
  static Color blueColor = HexColor('#1f4068');
  static Color lightBlueColor = HexColor('#bbe1fa');
  static Color whiteColor = Colors.white;
  static Color blackColor = HexColor('#2D2D2D');
  static Color lightGrayColor = HexColor('#CCCCCC');
  static Color grayColor = HexColor('#A5A5A5');
  static Color greenColor = HexColor('#407950');
  static Color redColor = HexColor('#ef4f4f');

  static brightnessColor() {
    if (Platform.isIOS) {
      return Brightness.light;
    } else {
      return null;
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

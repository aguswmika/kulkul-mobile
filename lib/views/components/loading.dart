import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingFour(itemBuilder: (BuildContext contenx, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: ColorHelper.blueColor,
        ),
      );
    });
  }
}

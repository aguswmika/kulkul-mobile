import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitRing(color: ColorHelper.blueColor,);
  }
}

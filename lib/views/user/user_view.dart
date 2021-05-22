import 'package:flutter/material.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.whiteColor,
      body: Center(child: Text('Anda tidak memiliki akses'),),
    );
  }
}
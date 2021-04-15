import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class SeparatorComponent extends StatelessWidget {
  final double height;
  final double width;

  SeparatorComponent({Key key, this.height, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveFlutter.of(context).wp(height),
      width: width == null ? null : ResponsiveFlutter.of(context).wp(width),
    );
  }
}

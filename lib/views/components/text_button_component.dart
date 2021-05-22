import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class TextButtonComponent extends StatelessWidget {
  TextButtonComponent({
    Key key,
    @required this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap ?? null,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).wp(5),
              vertical: ResponsiveFlutter.of(context).wp(2)),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(ResponsiveFlutter.of(context).wp(2)),
              color: ColorHelper.lightBlueColor),
          child: this.child),
    );
  }
}

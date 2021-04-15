import 'package:flutter/material.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';

class KulkulCaptionComponent extends StatelessWidget {
  final Widget child;
  final String title;
  final double bottom;

  KulkulCaptionComponent({Key key, @required this.title, @required this.child, this.bottom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: TextStyle(
              fontSize: Heading.h3,
              fontWeight: FontWeight.w500,
              color: ColorHelper.blackColor),
        ),
        SeparatorComponent(
          height: 2.5,
        ),
        child,
        SeparatorComponent(
          height: this.bottom ?? 6,
        ),
      ],
    );
  }
}

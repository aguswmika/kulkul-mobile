
import 'package:flutter/material.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';

class LocationComponent extends StatelessWidget {
  final String title;
  final String image;
  LocationComponent({Key key, this.title, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(
              color: ColorHelper.blackColor,
              borderRadius: BorderRadius.circular(10), 
            image: DecorationImage(image: NetworkImage(
                this.image,
              ), fit: BoxFit.cover),
            boxShadow: [
          BoxShadow(
              color: ColorHelper.lightGrayColor.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 5),
        ]),
        // padding: EdgeInsets.all(ResponsiveFlutter.of(context).wp(5)),
        child: Container(
          decoration:
            BoxDecoration(
              color: ColorHelper.blackColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10), ),
          child: Center(
            child: Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorHelper.whiteColor,
                  fontSize: Heading.h3,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ));
  }
}

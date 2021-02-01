import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';

class KulkulComponent extends StatelessWidget {
  final Kulkul data;
  final EdgeInsets margin;
  KulkulComponent({Key key, this.data, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorHelper.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: ColorHelper.lightGrayColor.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 5),
            ]),
        child: Column(children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveFlutter.of(context).wp(3),
                      left: ResponsiveFlutter.of(context).wp(3),
                      right: ResponsiveFlutter.of(context).wp(3)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        data.image,
                        fit: BoxFit.contain,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace stackTrace) {
                          return Container(
                              color: ColorHelper.grayColor,
                              alignment: Alignment.center,
                              child: Text('Image Not Found',
                                  style: TextStyle(
                                      color: ColorHelper.whiteColor,
                                      fontSize: Heading.h4,
                                      fontWeight: FontWeight.w500)));
                        },
                      )))),
          Container(
            height: ResponsiveFlutter.of(context).wp(20),
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveFlutter.of(context).wp(3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ColorHelper.blackColor,
                        fontSize: Heading.h3,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: ResponsiveFlutter.of(context).wp(1)),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: ColorHelper.greenColor),
                        SizedBox(width: ResponsiveFlutter.of(context).wp(1)),
                        Text(data.location,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorHelper.grayColor))
                      ]),
                )
              ],
            ),
          )
        ]));
  }
}

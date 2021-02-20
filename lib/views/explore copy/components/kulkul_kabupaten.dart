import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/views/explore/components/kulkul_component.dart';

class KulkulKabupaten extends StatelessWidget {
  final String title;
  final List<Kulkul> data;
  KulkulKabupaten({Key key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ResponsiveFlutter.of(context).wp(5)),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).wp(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.title,
                style: TextStyle(
                    fontSize: Heading.h3,
                    color: ColorHelper.blackColor,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Lainnya',
                style: TextStyle(
                    fontSize: Heading.h4,
                    color: ColorHelper.greenColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          height: ResponsiveFlutter.of(context).hp(40),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: ResponsiveFlutter.of(context).wp(45),
                  margin: EdgeInsets.only(
                    left: index == 0 ? ResponsiveFlutter.of(context).wp(4) : 0.0,
                    right: ResponsiveFlutter.of(context).wp(4),
                      bottom: ResponsiveFlutter.of(context).wp(4),
                      top: ResponsiveFlutter.of(context).wp(4)
                  ),
                  child: KulkulComponent(data: data[index]));
            },
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}

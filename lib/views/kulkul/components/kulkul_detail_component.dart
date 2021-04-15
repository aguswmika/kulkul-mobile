import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/views/components/carousel_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_caption_component.dart';

class KulkulDetailComponent extends StatelessWidget {
  final Kulkul kulkul;
  const KulkulDetailComponent({Key key, @required this.kulkul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeparatorComponent(
          height: 5,
        ),
        kulkul.imageGallery.length == 0
            ? Container(
                alignment: Alignment.center,
                child: Container(
                  width: ResponsiveFlutter.of(context).wp(90),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).wp(2)),
                      color: ColorHelper.blackColor),
                  alignment: Alignment.center,
                  height: ResponsiveFlutter.of(context).hp(30),
                  child: Text(
                    'Tidak ada gambar tersedia',
                    style: TextStyle(color: ColorHelper.whiteColor),
                  ),
                ),
              )
            : CarouselComponent(images: kulkul.imageGallery),
        SeparatorComponent(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).wp(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kulkul.names[0],
                style: TextStyle(
                    fontSize: Heading.h2,
                    color: ColorHelper.blueColor,
                    fontWeight: FontWeight.w700),
              ),
              SeparatorComponent(
                height: 6,
              ),
              KulkulCaptionComponent(
                  title: 'Jumlah Kulkul',
                  child: Row(
                    children: kulkul.numbers
                        .map((e) => Container(
                            margin: EdgeInsets.only(
                                right: ResponsiveFlutter.of(context).wp(2)),
                            child: CircleAvatar(
                              child: Text(
                                e.toString(),
                                style: TextStyle(color: ColorHelper.blueColor),
                              ),
                              backgroundColor: ColorHelper.lightBlueColor,
                            )))
                        .toList(),
                  )),
              KulkulCaptionComponent(
                title: 'Bahan Baku',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: kulkul.rawMaterials
                      .map((e) => Container(
                          margin: EdgeInsets.only(
                              bottom: ResponsiveFlutter.of(context).wp(2)),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ResponsiveFlutter.of(context).wp(5),
                                  vertical:
                                      ResponsiveFlutter.of(context).wp(2)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ResponsiveFlutter.of(context).wp(2)),
                                  color: ColorHelper.lightBlueColor),
                              child: Text(
                                e,
                                style: TextStyle(color: ColorHelper.blueColor),
                              ))))
                      .toList(),
                ),
              ),
              KulkulCaptionComponent(
                  title: 'Ukuran',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: kulkul.dimensions
                        .map((e) => Container(
                            margin: EdgeInsets.only(
                                bottom: ResponsiveFlutter.of(context).wp(2)),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveFlutter.of(context).wp(5),
                                    vertical:
                                        ResponsiveFlutter.of(context).wp(2)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResponsiveFlutter.of(context).wp(2)),
                                    color: ColorHelper.lightBlueColor),
                                child: Text(
                                  e,
                                  style:
                                      TextStyle(color: ColorHelper.blueColor),
                                ))))
                        .toList(),
                  )),
              KulkulCaptionComponent(
                  title: 'Pengangge',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: kulkul.pengangges
                        .map((e) => Container(
                            margin: EdgeInsets.only(
                                bottom: ResponsiveFlutter.of(context).wp(2)),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveFlutter.of(context).wp(5),
                                    vertical:
                                        ResponsiveFlutter.of(context).wp(2)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ResponsiveFlutter.of(context).wp(2)),
                                    color: ColorHelper.lightBlueColor),
                                child: Text(
                                  e,
                                  style:
                                      TextStyle(color: ColorHelper.blueColor),
                                ))))
                        .toList(),
                  )),
            ],
          ),
        )
      ],
    );
  }
}

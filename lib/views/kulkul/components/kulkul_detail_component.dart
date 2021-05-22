import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';
import 'package:semantic_kulkul/models/kulkul_model.dart';
import 'package:semantic_kulkul/routes.dart';
import 'package:semantic_kulkul/views/components/carousel_component.dart';
import 'package:semantic_kulkul/views/components/separator_component.dart';
import 'package:semantic_kulkul/views/components/text_button_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_caption_component.dart';
import 'package:semantic_kulkul/views/kulkul/components/kulkul_sound_component.dart';

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
                kulkul.names[0].value,
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
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.KulkulView, parameters: {
                                  'title': 'Jumlah - ${e.value}',
                                  'type': 'jumlah',
                                  'id': e.id
                                });
                              },
                              child: CircleAvatar(
                                child: Text(
                                  e.value.toString(),
                                  style:
                                      TextStyle(color: ColorHelper.blueColor),
                                ),
                                backgroundColor: ColorHelper.lightBlueColor,
                              ),
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
                          child: TextButtonComponent(
                            onTap: () {
                              Get.toNamed(Routes.KulkulView, parameters: {
                                'title': 'Bahan Baku - ${e.value}',
                                'type': 'bahan_baku',
                                'id': e.id
                              });
                            },
                            child: Text(
                              e.value,
                              style: TextStyle(color: ColorHelper.blueColor),
                            ),
                          )))
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
                            child: TextButtonComponent(
                              onTap: () {
                                Get.toNamed(Routes.KulkulView, parameters: {
                                  'title': 'Ukuran - ${e.value}',
                                  'type': 'ukuran',
                                  'id': e.id
                                });
                              },
                              child: Text(
                                e.value,
                                style: TextStyle(color: ColorHelper.blueColor),
                              ),
                            )))
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
                            child: TextButtonComponent(
                              onTap: () {
                                Get.toNamed(Routes.KulkulView, parameters: {
                                  'title': 'Pengangge - ${e.value}',
                                  'type': 'pengangge',
                                  'id': e.id
                                });
                              },
                              child: Text(
                                e.value,
                                style: TextStyle(color: ColorHelper.blueColor),
                              ),
                            )))
                        .toList(),
                  )),
              KulkulCaptionComponent(
                  title: 'Arah',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: kulkul.directions
                        .map((e) => Container(
                            margin: EdgeInsets.only(
                                bottom: ResponsiveFlutter.of(context).wp(2)),
                            child: TextButtonComponent(
                              onTap: () {
                                Get.toNamed(Routes.KulkulView, parameters: {
                                  'title': 'Arah - ${e.value}',
                                  'type': 'arah',
                                  'id': e.id
                                });
                              },
                              child: Text(
                                e.value,
                                style: TextStyle(color: ColorHelper.blueColor),
                              ),
                            )))
                        .toList(),
                  )),
              KulkulCaptionComponent(
                title: 'Suara',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: kulkul.sounds != null && kulkul.sounds.length > 0
                      ? kulkul.sounds
                          .map((e) => Container(
                                padding: EdgeInsets.only(
                                    bottom: ResponsiveFlutter.of(context).wp(2),
                                    top: ResponsiveFlutter.of(context).wp(2)),
                                decoration: BoxDecoration(
                                    border:
                                        Border(bottom: BorderSide(width: 1))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButtonComponent(
                                            onTap: () {
                                              Get.toNamed(Routes.KulkulView,
                                                  parameters: {
                                                    'title':
                                                        'Aktivitas - ${e.activity.value}',
                                                    'type': 'kegiatan',
                                                    'id': e.activity.id
                                                  });
                                            },
                                            child: Text(
                                                'Kegiatan : ${e.activity.value}')),
                                        SeparatorComponent(
                                          height: 1,
                                        ),
                                        TextButtonComponent(
                                            onTap: () {
                                              Get.toNamed(Routes.KulkulView,
                                                  parameters: {
                                                    'title':
                                                        'Suara - ${e.sound}',
                                                    'type': 'suara',
                                                    'id': e.sound
                                                  });
                                            },
                                            child: Text('Suara : ${e.sound}')),
                                        SeparatorComponent(
                                          height: 1,
                                        ),
                                        TextButtonComponent(
                                            onTap: () {
                                              Get.toNamed(Routes.KulkulView,
                                                  parameters: {
                                                    'title':
                                                        'Suara - ${e.type ?? 'Tidak diketahui'}',
                                                    'type': 'suara',
                                                    'id': e.type
                                                  });
                                            },
                                            child: Text(
                                                'Tipe : ${e.type ?? 'Tidak diketahui'}')),
                                      ],
                                    ),
                                    e.file != null && e.file.isNotEmpty
                                        ? KulkulSoundComponent(url: e.file)
                                        : Container(
                                            child: Text(
                                              'Tidak\nTersedia',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                  ],
                                ),
                              ))
                          .toList()
                      : [Text('Data suara belum tersedia')],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

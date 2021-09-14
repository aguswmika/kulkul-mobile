import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';

class ImageUploadComponent extends StatefulWidget {
  final Function(File) onChange;
  final File initialValue;
  final Function onRemove;
  ImageUploadComponent(
      {Key key, this.onChange, this.initialValue, this.onRemove})
      : super(key: key);
  @override
  _ImageUploadComponentState createState() => _ImageUploadComponentState();
}

class _ImageUploadComponentState extends State<ImageUploadComponent> {
  File _image;

  final picker = ImagePicker();

  void dialogImagePicker() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              InkWell(
                  onTap: () {
                    getImage(context, ImageSource.camera);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.all(ResponsiveFlutter.of(context).wp(3)),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.camera),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: Heading.h3),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: ResponsiveFlutter.of(context).wp(5),
              ),
              InkWell(
                  onTap: () {
                    getImage(context, ImageSource.gallery);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.all(ResponsiveFlutter.of(context).wp(3)),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.image),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Gallery', style: TextStyle(fontSize: Heading.h3)),
                      ],
                    ),
                  )),
              widget.onRemove != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ResponsiveFlutter.of(context).wp(5),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              widget.onRemove();
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  ResponsiveFlutter.of(context).wp(3)),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.close),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Hapus',
                                      style: TextStyle(fontSize: Heading.h3)),
                                ],
                              ),
                            )),
                      ],
                    )
                  : Container()
            ],
          );
        });
  }

  Future getImage(context, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    if (widget.onChange != null) {
      widget.onChange(_image);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          dialogImagePicker();
        },
        child: widget.initialValue == null ||  _image != null
            ? (_image == null
                ? Container(
                    child: Icon(
                      Icons.add,
                      color: HexColor('#c4c4c4'),
                      size: ResponsiveFlutter.of(context).fontSize(5),
                    ),
                    color: ColorHelper.lightGrayColor,
                    height: ResponsiveFlutter.of(context).wp(25),
                    width: ResponsiveFlutter.of(context).wp(25),
                  )
                : widget.initialValue == null ? Container(
                    child: Icon(
                      Icons.add,
                      color: HexColor('#c4c4c4'),
                      size: ResponsiveFlutter.of(context).fontSize(5),
                    ),
                    color: ColorHelper.lightGrayColor,
                    height: ResponsiveFlutter.of(context).wp(25),
                    width: ResponsiveFlutter.of(context).wp(25),
                  ) : Image.file(
                    _image,
                    fit: BoxFit.cover,
                    height: ResponsiveFlutter.of(context).wp(25),
                    width: ResponsiveFlutter.of(context).wp(25),
                    errorBuilder: (context, error, stackTrace) => Container(
                      child: Icon(
                        Icons.add,
                        color: HexColor('#c4c4c4'),
                        size: ResponsiveFlutter.of(context).fontSize(5),
                      ),
                      color: ColorHelper.lightGrayColor,
                      height: ResponsiveFlutter.of(context).wp(25),
                      width: ResponsiveFlutter.of(context).wp(25),
                    ),
                  ))
            : Image.file(widget.initialValue,
                errorBuilder: (context, error, stackTrace) => Container(
                      child: Icon(
                        Icons.add,
                        color: HexColor('#c4c4c4'),
                        size: ResponsiveFlutter.of(context).fontSize(5),
                      ),
                      color: ColorHelper.lightGrayColor,
                      height: ResponsiveFlutter.of(context).wp(25),
                      width: ResponsiveFlutter.of(context).wp(25),
                    ),
                fit: BoxFit.cover,
                height: ResponsiveFlutter.of(context).wp(25),
                width: ResponsiveFlutter.of(context).wp(25)));
  }
}

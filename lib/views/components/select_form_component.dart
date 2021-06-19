import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class SelectFormComponent extends StatefulWidget {
  final List<SelectItem> data;
  final Function(String) onChange;
  final String value;
  final Function(String) validator;

  SelectFormComponent({Key key, @required this.data, @required this.onChange, this.value, this.validator}): super(key: key);
  @override
  _SelectFormComponentState createState() => _SelectFormComponentState();
}

class _SelectFormComponentState extends State<SelectFormComponent> {
  String initialValue;

  // @override
  // void initState() {
  //   initialValue = widget.value;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: widget.value,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveFlutter.of(context).wp(8),
          ),
          fillColor: ColorHelper.lightGrayColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                  Radius.circular(ResponsiveFlutter.of(context).wp(4)))),
        ),
        elevation: 0,
        onChanged: (String value) {
          widget.onChange(value);
          setState(() {});
        },
        items: widget.data.isNotEmpty ? [
          DropdownMenuItem(
            child: Text('--- Pilih ---'),
            value: '',
          ),
          ...widget.data
              .map(
                (item) => DropdownMenuItem(
                  child: Text(item.value ?? '-'),
                  value: item.id,
                ),
              )
        ] : [
          DropdownMenuItem(
            child: Text('--- Pilih ---'),
            value: '',
          )],);
  }
}

class SelectItem {
    SelectItem({
        this.id,
        this.value,
    });

    String id;
    String value;

    factory SelectItem.fromJson(String str) => SelectItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SelectItem.fromMap(Map<String, dynamic> json) => SelectItem(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
    };
}
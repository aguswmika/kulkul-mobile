import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'package:semantic_kulkul/helpers/color_helper.dart';

class TextFormComponent extends StatefulWidget {
  final Widget prefixIcon;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final TextInputAction textInputAction;
  final bool autocorrect;
  final Function(String) onChanged;
  final String hintText;
  final Function(String) validator;
  final int maxLines;
  final TextInputType keyboardType;

  TextFormComponent(
      {Key key,
      this.prefixIcon,
      this.inputFormatters,
      this.obscureText,
      this.textInputAction,
      this.autocorrect,
      this.onChanged,
      this.hintText,
      this.validator,
      this.maxLines,
      this.keyboardType})
      : super(key: key);

  @override
  _TextFormComponentState createState() => _TextFormComponentState();
}

class _TextFormComponentState extends State<TextFormComponent> {
  FocusNode _focusNode;

  @override
  void initState() {
    setState(() {
      _focusNode = FocusNode();
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      validator: widget.validator ?? null,
      onChanged: widget.onChanged ?? (String value) {},
      inputFormatters: widget.inputFormatters ?? null,
      obscureText: widget.obscureText ?? false,
      textInputAction: widget.textInputAction ?? null,
      autocorrect: widget.autocorrect ?? true,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      maxLines: widget.maxLines ?? 1,
      onEditingComplete: () {
        _focusNode.unfocus();
      },
      decoration: InputDecoration(
          hintText: widget.hintText ?? null,
          prefixIcon: widget.prefixIcon ?? null,
          contentPadding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).wp(2),
              vertical: ResponsiveFlutter.of(context).wp(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorHelper.lightGrayColor,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius:
                  BorderRadius.circular(ResponsiveFlutter.of(context).wp(3))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorHelper.lightGrayColor,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius:
                  BorderRadius.circular(ResponsiveFlutter.of(context).wp(3))),
          filled: true,
          fillColor: Colors.white),
    );
  }
}

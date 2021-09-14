import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class RadioButtonComponent extends StatefulWidget {
  final List<RadioModel> data;
  final Function(String value) onChange;
  RadioButtonComponent({Key key, @required this.data, @required this.onChange})
      : super(key: key);
  @override
  createState() {
    return RadioButtonComponentState();
  }
}

class RadioButtonComponentState extends State<RadioButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          widget.data.length,
          (int index) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: ResponsiveFlutter.of(context).wp(2)),
              child: GestureDetector(
                child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(
                        vertical: ResponsiveFlutter.of(context).wp(3)),
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.data[index].isSelected
                            ? ColorHelper.lightBlueColor
                            : ColorHelper.lightGrayColor),
                    child: Text(widget.data[index].label, style: TextStyle(fontWeight: FontWeight.w600),)),
                onTap: () {
                  setState(() {
                    widget.data
                        .forEach((element) => element.isSelected = false);
                    widget.data[index].isSelected = true;
                  });

                  widget.onChange(widget.data[index].value);
                },
              ),
            );
          },
        ));
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(_item.value,
                  style: TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(_item.label),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String value;
  final String label;

  RadioModel(this.isSelected, this.value, this.label);
}

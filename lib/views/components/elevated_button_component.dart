import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final Function onPressed;
  final MaterialStateProperty<Color> backgroundColor;
  final Widget child;


  ElevatedButtonComponent({Key key, this.onPressed, this.backgroundColor, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: this.onPressed,
        child: this.child,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(ResponsiveFlutter.of(context).wp(2)),
                side: BorderSide.none)),
            backgroundColor: this.backgroundColor ?? null));
  }
}

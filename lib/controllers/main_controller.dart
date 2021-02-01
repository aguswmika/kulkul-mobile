import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';
import 'package:semantic_kulkul/helpers/text_helper.dart';

abstract class MainStatalessController extends StatelessWidget {
  final BuildContext _loadingContext = Get.context;
  void loading() {
    showDialog(
      context: _loadingContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            // height: ResponsiveFlutter.of(context).wp(20),
            alignment: Alignment.center,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: ColorHelper.whiteColor,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorHelper.blueColor),
                ),
                SizedBox(height: ResponsiveFlutter.of(context).wp(5)),
                Text("Loading...",
                    style: TextStyle(
                        color: ColorHelper.blueColor,
                        fontSize: Heading.h3,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      },
    );
  }

  void closeLoading() {
    Navigator.pop(_loadingContext);
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:semantic_kulkul/helpers/color_helper.dart';

class CarouselComponent extends StatefulWidget {
  final List<String> images;
  CarouselComponent({Key key, @required this.images}) : super(key: key);
  @override
  _CarouselComponentState createState() => _CarouselComponentState();
}

class _CarouselComponentState extends State<CarouselComponent> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  viewportFraction: 0.92,
                  height: ResponsiveFlutter.of(context).hp(30),
                  onPageChanged: (int page, CarouselPageChangedReason reason) =>
                      setState(() {
                        currentSlide = page;
                      })),
              items: widget.images.take(10).map((item) {
                return Container(
                    width: ResponsiveFlutter.of(context).wp(100),
                    margin: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).wp(1.5)),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).wp(2)), color: ColorHelper.blackColor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).wp(2)),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Text('404'),
                      ),
                    ));
              }).toList(),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.take(10).map((url) {
              int index = widget.images.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentSlide == index
                      ? ColorHelper.blueColor
                      : ColorHelper.whiteColor,
                ),
              );
            }).toList()))
          ],
        ),
      ],
    );
  }
}

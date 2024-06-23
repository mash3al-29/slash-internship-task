import 'package:flutter/material.dart';
import 'package:slash/views/widgets/inventory.dart';
import 'colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({super.key});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _currentIndex = 0;

  List<Widget> _buildImageSliders(double width, double height) {
    return [
      ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          Inventory.hotDealImage1,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          Inventory.hotDealImage2,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.85;
        double height = width * 0.4;

        final List<Widget> imageSliders = _buildImageSliders(width, height);

        return Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = entry.key;
                    });
                  },
                  child: Container(
                    width: _currentIndex == entry.key ? 14.0 : 7.0,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      color: _currentIndex == entry.key
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

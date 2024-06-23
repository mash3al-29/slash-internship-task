import 'package:flutter/material.dart';
import 'package:slash/views/widgets/inventory.dart';
import 'colors.dart';

class HorizontalSliderButton extends StatelessWidget {
  const HorizontalSliderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47.0,
      height: 45.0,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        child: Center(
          child: Image.asset(
            Inventory.horizontalSliderIcon,
            width: 17.14,
            height: 17.77,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

class TextHeader extends StatelessWidget {
  final String title;
  final String type;

  const TextHeader({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: type == 'Web' ? AppFonts.headerWebTextStyle : AppFonts.headerMobileTextStyle,
          ),
          Row(
            children: [
              const Text(
                'See all',
                style: AppFonts.seeAllTextStyle,
              ),
              const SizedBox(width: 10.0),
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: AppColors.disabledColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Image.asset(
                  'assets/icons/arrow-left.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

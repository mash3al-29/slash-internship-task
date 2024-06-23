import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

class IconTextWidget extends StatelessWidget {
  final String iconPath;
  final String label;

  const IconTextWidget({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(150),
              ),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Image.asset(
                  iconPath,
                  width: 34.0,
                  height: 34.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: const TextStyle(
                fontFamily: AppFonts.fontFamily,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
                height: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8.0,)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'colors.dart';

Widget BuildBottomNavItem(String assetPath, String label, int index, int selectedIndex) {
  bool isSelected = selectedIndex == index;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (isSelected)
        Container(
          width: 92,
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(3),
            ),
          ),
        ),
      const SizedBox(height: 4),
      Image.asset(
        assetPath,
        width: 30,
        height: 30,
      ),
    ],
  );
}

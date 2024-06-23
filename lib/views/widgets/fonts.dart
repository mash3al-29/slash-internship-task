import 'package:flutter/material.dart';
import 'package:slash/views/widgets/colors.dart';

class AppFonts {
  static const String fontFamily = 'Urbanist';
  static const TextStyle headerMobileTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle headerWebTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle seeAllTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  color: AppColors.primaryColor,
  );

  static const TextStyle searchHintTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.hintColor,
  );

  static const TextStyle searchInputTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.hintColor,
  );
}

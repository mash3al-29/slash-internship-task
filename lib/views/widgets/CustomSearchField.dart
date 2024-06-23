import 'package:flutter/material.dart';
import 'package:slash/views/widgets/inventory.dart';
import 'colors.dart';
import 'fonts.dart';

class CustomSearchField extends StatelessWidget {
  final String type;

  const CustomSearchField({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272.0,
      height: 45.0,
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: Image.asset(
              Inventory.searchIcon,
              width: 20.0,
              height: 20.0,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: type == 'Mobile'
                      ? const EdgeInsets.only(top: 35)
                      : const EdgeInsets.only(bottom: 15),
                  border: InputBorder.none,
                  hintText: 'Search here..',
                  hintStyle: AppFonts.searchHintTextStyle,
                ),
                style: AppFonts.searchInputTextStyle,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

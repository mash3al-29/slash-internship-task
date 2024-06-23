import 'package:flutter/material.dart';
import 'package:slash/views/widgets/GridViewWidget.dart';
import 'package:slash/views/widgets/HorizontalSliderButton.dart';
import 'package:slash/views/widgets/CustomSearchField.dart';
import 'package:slash/views/widgets/TextHeader.dart';
import 'package:slash/views/widgets/IconTextWidget.dart';
import 'package:slash/views/widgets/ListItems.dart';
import 'package:slash/views/widgets/inventory.dart';
import 'package:slash/cubit/SharedCubit.dart';
import 'package:slash/data/repositories/SharedRepo.dart';
import 'package:slash/viewmodels/SharedViewModel.dart';

class CommonWidgets {
  static Widget buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Slash.',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: 'Urbanist',
            )),
        Row(
          children: [
            Image.asset(Inventory.locationIcon, width: 24.0, height: 24.0),
            const SizedBox(width: 5),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nasr City',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Cairo',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Image.asset(Inventory.arrowDownIcon, width: 30.0, height: 30.0),
          ],
        ),
        Stack(
          children: [
            Image.asset(Inventory.notificationIcon, width: 30.0, height: 30.0),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget buildSearchAndButton(BuildContext context, String type) {
    return Row(
      children: [
        Expanded(child: CustomSearchField(type: type)),
        const SizedBox(width: 8.0),
        const HorizontalSliderButton(),
      ],
    );
  }

  static Widget buildCategoryRow() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 10),
          IconTextWidget(iconPath: Inventory.shirtIcon, label: 'Fashion'),
          IconTextWidget(iconPath: Inventory.diceIcon, label: 'Games'),
          IconTextWidget(iconPath: Inventory.glassesIcon, label: 'Accessories'),
          IconTextWidget(iconPath: Inventory.bookBlankIcon, label: 'Books'),
          IconTextWidget(iconPath: Inventory.paletteIcon, label: 'Artifacts'),
          IconTextWidget(iconPath: Inventory.pinataIcon, label: 'Pets Care'),
        ],
      ),
    );
  }

  static Widget buildGridSection(
      String title, String type, ItemRepository repository) {
    return Column(
      children: [
        TextHeader(title: title, type: type),
        const SizedBox(height: 16),
        GridViewWidget(
          viewModel: ItemViewModel(
            cubit: ItemCubit(repository: repository, type: type),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }

  static Widget buildListSection(
      String title, String type, ItemRepository repository) {
    return Column(
      children: [
        TextHeader(title: title, type: type),
        const SizedBox(height: 16),
        ListItemWidgets(
          viewModel: ItemViewModel(
            cubit: ItemCubit(repository: repository, type: type),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}

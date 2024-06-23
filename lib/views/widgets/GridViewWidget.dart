import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/cubit/SharedCubit.dart';
import 'package:slash/models/SharedModel.dart';
import 'package:slash/viewmodels/SharedViewModel.dart';
import 'package:slash/views/widgets/SingleItemWidget.dart';
import 'package:slash/views/widgets/inventory.dart';

class GridViewWidget extends StatelessWidget {
  final ItemViewModel viewModel;

  const GridViewWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems();
    final List<String> icons = [
      Inventory.iconSnail,
      Inventory.iconHelp,
      Inventory.iconArrow,
    ];
    Random random = Random();
    return BlocBuilder<ItemCubit, List<Item>>(
      bloc: viewModel.cubit,
      builder: (context, items) {
        return SizedBox(
          height: 200.0,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.75,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              String randomIcon = icons[random.nextInt(icons.length)];
              return SingleItemWidget(item: item, randomIcon: randomIcon);
            },
          ),
        );
      },
    );
  }
}

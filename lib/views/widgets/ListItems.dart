import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/cubit/SharedCubit.dart';
import 'package:slash/models/SharedModel.dart';
import 'package:slash/viewmodels/SharedViewModel.dart';
import 'package:slash/views/widgets/SingleItemWidget.dart';

class ListItemWidgets extends StatelessWidget {
  final ItemViewModel viewModel;

  const ListItemWidgets({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems();
    final List<String> icons = [
      "assets/icons/snail.png",
      "assets/icons/help.png",
      "assets/icons/arrow.png",
    ];
    Random random = Random();

    return BlocBuilder<ItemCubit, List<Item>>(
      bloc: viewModel.cubit,
      builder: (context, items) {
        return SizedBox(
          height: 198.0,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              String randomIcon = icons[random.nextInt(icons.length)];
              final item = items[index];
              return SingleItemWidget(item: item, randomIcon: randomIcon);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8.0);
            },
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}

import 'package:slash/cubit/SharedCubit.dart';

class ItemViewModel {
  final ItemCubit cubit;

  ItemViewModel({required this.cubit});

  void fetchItems() {
    cubit.loadItems();
  }
}

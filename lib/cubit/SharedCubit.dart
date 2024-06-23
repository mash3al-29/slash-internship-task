import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/data/repositories/SharedRepo.dart';
import 'package:slash/models/SharedModel.dart';

class ItemCubit extends Cubit<List<Item>> {
  final ItemRepository repository;
  final String type;

  ItemCubit({required this.repository, required this.type}) : super([]);

  void loadItems() async {
    final items = await repository.fetchItems(type);
    emit(items);
  }


}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:slash/models/SharedModel.dart';

class ItemRepository {
  Future<List<Item>> fetchItems(String type) async {
    final String response = await rootBundle.loadString('assets/dummyData.json');
    final data = json.decode(response);

    final List<Item> items = (data[type] as List)
        .map((item) => Item.fromJson(item))
        .toList();

    return items;
  }
}

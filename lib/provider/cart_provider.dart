import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:coffee/model/cofee_model.dart";

class CartNotifier extends StateNotifier<List<CoffeeModel>> {
  CartNotifier() : super([]);
  void addItems(CoffeeModel items) {
    var exItems = state.where((itm) => itm.id == items.id);
    if (exItems.isNotEmpty) {
      return;
    }
    state = [...state, items];
  }

  void removeItems(CoffeeModel items) {
    state = state.where((itm) => itm.id != items.id).toList();
  }

}

final cartProvider = StateNotifierProvider<CartNotifier, List<CoffeeModel>>(
    (ref) => CartNotifier());

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

  double getTotalPrice() {
    return state.fold(
      0,
      (total, items) => total + double.parse(items.price),
    );
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CoffeeModel>>(
    (ref) => CartNotifier());

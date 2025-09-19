// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_demo/item.dart';
//
// import 'favourite/item.dart';
//
// final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
//   return ItemNotifier();
// });
//
// class ItemNotifier extends StateNotifier<List<Item>> {
//   ItemNotifier() : super([]);
//   void addItem(String name) {
//     final item = Item(id: 1, name: name, favourite: );
//     state.add(item);
//     state = state.toList();
//   }
//
//   void deleteItem(String id) {
//     state.removeWhere((element) => element.id == id);
//     state = state.toList();
//   }
//
//   void updateItem(String id, String name) {
//     int fountIndex = state.indexWhere((element) => element.id == id);
//     state[fountIndex].name = name;
//     state = state.toList();
//   }
// }

import 'package:riverpod_demo/favourite/favourite_provider.dart';

import '../item.dart';
import 'item.dart';

class FavouriteState {
  final List<Item> allItem;
  final List<Item> filterdItem;
  final String search;
  FavouriteState(
      {required this.allItem, required this.filterdItem, required this.search});

  FavouriteState copyWith({
    List<Item>? allItem,
    List<Item>? filterdItem,
    String? search,
  }) {
    return FavouriteState(
        allItem: allItem ?? this.allItem,
        filterdItem: filterdItem ?? this.filterdItem,
        search: search ?? this.search);
  }
}

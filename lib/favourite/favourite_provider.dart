import 'package:riverpod/riverpod.dart';
import 'favouritestate.dart';
import 'item.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>(
  (ref) => FavouriteNotifier(),
);

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
      : super(FavouriteState(allItem: [], filterdItem: [], search: ''));

  void addItem() {
    List<Item> item = [
      Item(name: 'keyboard', id: 1, favourite: true),
      Item(name: 'mouse', id: 2, favourite: false),
      Item(name: 'monitor', id: 3, favourite: true),
      Item(name: 'teamwork', id: 4, favourite: false),
      Item(name: 'ipad', id: 5, favourite: true)
    ];
    state = state.copyWith(allItem: item, filterdItem: item);
  }

  void toggleFavourite(int id) {
    final updated = state.allItem.map((e) {
      if (e.id == id) {
        return e.copyWith(favourite: !e.favourite);
      }
      return e;
    }).toList();

    state = state.copyWith(
        allItem: updated, filterdItem: _filter(updated, state.search));
  }
  // void toggleFavourite(int id) {
  //   final updated = state.allItem.map((e) {
  //     if (e.id == id) {
  //       return e.copyWith(favourite: !e.favourite);
  //     }
  //     return e;
  //   }).toList();
  //
  //   state = state.copyWith(
  //       allItem: updated, filterdItem: _filter(updated, state.search));
  // }

  void setSearch(String query) {
    state = state.copyWith(
      search: query,
      filterdItem: _filter(state.allItem, query),
    );
  }

  List<Item> _filter(List<Item> items, String query) {
    if (query.isEmpty) return items;
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/itemprovider.dart';

// final name = Provider<String>((ref) {
//   return 'genini';
// });
// final age = StateProvider<int>((ref) {
//   return 90;
// });
// final ison = StateProvider<bool>((ref) {
//   return false;
// });

//------- simple provider -----------
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name1 = ref.watch(name);
//     final age1 = ref.watch(age);
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Text('${name1} ${age1}'),
//           )
//         ],
//       ),
//     );
//   }
// }

// ----------------state provider------------------

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final age1 = ref.watch(age);
//     final name1 = ref.watch(name);
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Consumer(builder: (context, ref, child) {
//             return Center(
//               child: Text('${name1} ${age1}'),
//             );
//           }),
//           ElevatedButton(
//               onPressed: () {
//                 ref.read(age.notifier).state++;
//               },
//               child: Text('+')),
//           Consumer(builder: (context, ref, child) {
//             return Switch(
//                 value: ref.watch(ison),
//                 onChanged: (value) {
//                   ref.read(ison.notifier).state = value;
//                 });
//           })
//         ],
//       ),
//     );
//   }
// }

// --- multistate provider ----------
// final fen = StateProvider<AppState>((ref) {
//   return AppState(slider: .1, showpassword: false);
// });
//
// class AppState {
//   final double slider;
//   final bool showpassword;
//   AppState({required this.slider, required this.showpassword});
//   AppState copyWith({double? slider, bool? showpassword}) {
//     return AppState(
//         slider: slider ?? this.slider,
//         showpassword: showpassword ?? this.showpassword);
//   }
// }
//
// class Homescreen extends ConsumerWidget {
//   const Homescreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final coursor1 = ref.watch(fen);
//
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Consumer(builder: (context, ref, child) {
//             return Container(
//               height: 200,
//               width: 200,
//               color: Colors.red.withOpacity(coursor1.slider),
//             );
//           }),
//           Consumer(builder: (context, ref, child) {
//             return Slider(
//                 value: coursor1.slider,
//                 onChanged: (value) {
//                   ref.read(fen.notifier).state =
//                       coursor1.copyWith(slider: value);
//                 });
//           })
//         ],
//       ),
//     );
//   }
// }

// class SearchState {
//   final String search;
//   SearchState({required this.search});
//   SearchState copyWith({String? search}) {
//     return SearchState(search: search ?? this.search);
//   }
// }
//
// final searchProvider =
//     StateNotifierProvider<SearchNotifier, SearchState>((ref) {
//   return SearchNotifier();
// });
//
// class SearchNotifier extends StateNotifier<SearchState> {
//   SearchNotifier() : super(SearchState(search: ''));
//
//   void search(String query) {
//     state = state.copyWith(search: query);
//   }
// }
//
// class Homescreen extends ConsumerWidget {
//   const Homescreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = TextEditingController();
//     final searchState = ref.watch(searchProvider);
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Consumer(builder: (context, ref, child) {
//             return Text(
//               searchState.search,
//               style: const TextStyle(fontSize: 20),
//             );
//           }),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: controller,
//               decoration: const InputDecoration(
//                 hintText: "Enter search query",
//               ),
//               onChanged: (value) {
//                 ref.read(searchProvider.notifier).search(value);
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // update state
//               ref.read(searchProvider.notifier).search(controller.text);
//             },
//             child: const Text("Search"),
//           )
//         ],
//       ),
//     );
//   }
// }

// todo app
// class Homescreen extends ConsumerWidget {
//   const Homescreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final item = ref.watch(itemProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('counter app'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(itemProvider.notifier).addItem('new item');
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Container(
//         height: 300,
//         decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//         child: ListView.builder(
//             itemCount: item.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               final itemDetail = item[index];
//               return ListTile(
//                 title: Text(itemDetail.name),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           ref
//                               .read(itemProvider.notifier)
//                               .updateItem(itemDetail.id, 'Update item');
//                         },
//                         child: Icon(Icons.edit)),
//                     SizedBox(
//                       width: 30,
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           ref
//                               .read(itemProvider.notifier)
//                               .deleteItem(itemDetail.id);
//                         },
//                         child: Icon(Icons.delete)),
//                   ],
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }

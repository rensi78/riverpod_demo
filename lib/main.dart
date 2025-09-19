import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'favourite/favourite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homescreen(),
      ),
    );
  }
}

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favState = ref.watch(favouriteProvider);
    final favNotifier = ref.read(favouriteProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Items"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => favNotifier.addItem(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search items...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => favNotifier.setSearch(value),
            ),
          ),

          // Item list
          Expanded(
            child: favState.filterdItem.isEmpty
                ? Center(child: Text("No items found"))
                : ListView.builder(
                    itemCount: favState.filterdItem.length,
                    itemBuilder: (context, index) {
                      final item = favState.filterdItem[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: IconButton(
                          icon: Icon(
                            item.favourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.favourite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () => favNotifier.toggleFavourite(item.id),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

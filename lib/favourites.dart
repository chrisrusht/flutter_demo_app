import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Define the onRefresh function
  Future<void> _refreshItems() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    // Update the items (you could fetch new data here)
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return SafeArea(
      child: appState.favorites.isEmpty
          ? Center(
              child: Text('No favorites yet.'),
            )
          : RefreshIndicator(
              onRefresh: _refreshItems,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('You have '
                        '${appState.favorites.length} favorites:'),
                  ),
                  for (var pair in appState.favorites)
                    Dismissible(
                      key: Key(pair.asLowerCase),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: theme.colorScheme.primary,
                        child: Icon(Icons.delete),
                      ),
                      onDismissed: (direction) {
                        appState.removeFavorite(pair);
                      },
                      child: ListTile(
                        leading: Icon(Icons.favorite),
                        title: Text(pair.asLowerCase),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Swipe to remove from favorites'),
                  ),
                ],
              ),
            ),
    );
  }
}
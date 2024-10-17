import 'package:book/BookDeatils.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteBooks;

  const FavoritesPage({super.key, required this.favoriteBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Books")),
      body: ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteBooks[index]['title']),
            subtitle: Text(favoriteBooks[index]['author']),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
// Remove from favorites functionality can be added here
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(
                    title: favoriteBooks[index]['title'],
                    author: favoriteBooks[index]['author'],
                    description: favoriteBooks[index]['description'],
                    imageUrl: favoriteBooks[index]['image'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

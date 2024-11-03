import 'package:book/BookDeatils.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteBooks;

  const FavoritesPage({Key? key, required this.favoriteBooks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Books")),
      body: ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(favoriteBooks[index]['image']),
            title: Text(favoriteBooks[index]['title']),
            subtitle: Text(
              favoriteBooks[index]['author'],
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                // You may want to implement removing from favorites here
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
                    rating: favoriteBooks[index]['rating'].toString(),
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

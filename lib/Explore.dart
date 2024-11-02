import 'package:book/BookDeatils.dart';
import 'package:book/Favourite.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  // List to keep track of favorite books
  List<Map<String, dynamic>> favoriteBooks = [];

  // Dummy data for Game of Thrones books
  final List<Map<String, dynamic>> gameOfThronesBooks = [
    {
      'title': 'A Game of Thrones',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/a_game_of_thrones.jpg',
      'description':
          'The first novel in the epic series A Song of Ice and Fire.',
      'rating': 4.5,
      'isFavorite': false,
    },
    {
      'title': 'A Clash of Kings',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/a_clash_of_kings.jpg',
      'description':
          'The second novel in the epic series A Song of Ice and Fire.',
      'rating': 4.6,
      'isFavorite': false,
    },
    {
      'title': 'A Storm of Swords',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/a_storm_of_swords.jpg',
      'description':
          'The third novel in the epic series A Song of Ice and Fire.',
      'rating': 4.7,
      'isFavorite': false,
    },
    {
      'title': 'A Feast for Crows',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/a_feast_for_crows.jpg',
      'description':
          'The fourth novel in the epic series A Song of Ice and Fire.',
      'rating': 4.4,
      'isFavorite': false,
    },
    {
      'title': 'A Dance with Dragons',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/a_dance_with_dragons.jpg',
      'description':
          'The fifth novel in the epic series A Song of Ice and Fire.',
      'rating': 4.5,
      'isFavorite': false,
    },
    {
      'title': 'The Winds of Winter',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/the_winds_of_winter.jpg',
      'description':
          'Upcoming sixth novel in the series A Song of Ice and Fire.',
      'rating': 0.0, // Not released yet
      'isFavorite': false,
    },
    {
      'title': 'A Dream of Spring',
      'author': 'George R. R. Martin',
      'image': 'https://example.com/a_dream_of_spring.jpg',
      'description':
          'Upcoming seventh novel in the series A Song of Ice and Fire.',
      'rating': 0.0, // Not released yet
      'isFavorite': false,
    },
  ];

  // Dummy data for Harry Potter books
  final List<Map<String, dynamic>> harryPotterBooks = [
    // ... your existing Harry Potter books data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Column(
        children: [
          // Game of Thrones Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Game of Thrones Books',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 200,
            child: PageView.builder(
              itemCount: gameOfThronesBooks.length,
              itemBuilder: (context, index) {
                final book = gameOfThronesBooks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          title: book['title'],
                          author: book['author'],
                          description: book['description'],
                          imageUrl: book['image'],
                          rating: book['rating'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        // Image occupies 1/3 of the card
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20), // Border radius
                            image: DecorationImage(
                              image:
                                  NetworkImage(book["image"]), // Load the image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Title and Author centered on the right
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book["title"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                    height:
                                        4), // Spacing between title and author
                                Text(
                                  "by ${book["author"]}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                // IconButton(
                                //   icon: Icon(
                                //     book['isFavorite']
                                //         ? Icons.favorite
                                //         : Icons.favorite_border,
                                //     color:
                                //         book['isFavorite'] ? Colors.red : null,
                                //   ),
                                //   // onPressed: () {
                                //   toggleFavorite(
                                //       index, true); // For Game of Thrones
                                // },
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Harry Potter Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Harry Potter Books',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 200,
            child: PageView.builder(
              itemCount: harryPotterBooks.length,
              itemBuilder: (context, index) {
                final book = harryPotterBooks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          title: book['title'],
                          author: book['author'],
                          description: book['description'],
                          imageUrl: book['image'],
                          rating: book['rating'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        // Image occupies 1/3 of the card
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20), // Border radius
                            image: DecorationImage(
                              image:
                                  NetworkImage(book["image"]), // Load the image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Title and Author centered on the right
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book["title"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                    height:
                                        4), // Spacing between title and author
                                Text(
                                  "by ${book["author"]}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                // IconButton(
                                //   icon: Icon(
                                //     book['isFavorite']
                                //         ? Icons.favorite
                                //         : Icons.favorite_border,
                                //     color:
                                //         book['isFavorite'] ? Colors.red : null,
                                //   ),
                                //   onPressed: () {
                                //     toggleFavorite(
                                //         index, false); // For Harry Potter
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
          color: Colors.redAccent,
        ),
        onPressed: () {
          if (favoriteBooks.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No favorite books yet!')),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesPage(
                  favoriteBooks: favoriteBooks,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

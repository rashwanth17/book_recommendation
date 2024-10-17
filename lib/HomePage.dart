import 'package:book/BookDeatils.dart';
import 'package:book/Favourite.dart';
import 'package:book/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Readly',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> books = [
    {
      "title": "The Molecule of More",
      "author": "Daniel Z. Lieberman",
      "description":
          "This book explores the molecule dopamine and how it drives human desires and behavior.",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.pjy7XSMg104j1TgZRu9-mAHaLK&pid=Api&P=0&h=180",
      "isFavorite": false,
    },
    {
      "title": "Think Like a Monk",
      "author": "Jay Shetty",
      "description":
          "The book offers advice on how to live a more meaningful, balanced, and focused life.",
      "image":
          "https://tse3.mm.bing.net/th?id=OIP.PoUdNGX14FatO70x8D5eRQAAAA&pid=Api&P=0&h=180",
      "isFavorite": false,
    },
    {
      "title": "The Psychology of Money",
      "author": "Morgan Housel",
      "description":
          "This book teaches timeless lessons on wealth, greed, and happiness.",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.518hVWocEw9J7sf9n00CywHaIq&pid=Api&P=0&h=180",
      "isFavorite": false,
    },
    {
      "title": "The Molecule of More",
      "author": "Daniel Z. Lieberman",
      "description":
          "This book explores the molecule dopamine and how it drives human desires and behavior.",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.pjy7XSMg104j1TgZRu9-mAHaLK&pid=Api&P=0&h=180",
      "isFavorite": false,
    },
    {
      "title": "The Molecule of More",
      "author": "Daniel Z. Lieberman",
      "description":
          "This book explores the molecule dopamine and how it drives human desires and behavior.",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.pjy7XSMg104j1TgZRu9-mAHaLK&pid=Api&P=0&h=180",
      "isFavorite": false,
    },
  ];

  // Toggle the favorite status
  void toggleFavorite(int index) {
    setState(() {
      books[index]['isFavorite'] = !books[index]['isFavorite'];
    });
  }

  List<Map<String, dynamic>> get favoriteBooks =>
      books.where((book) => book['isFavorite']).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Center(
          child: Text(
            'READLY',
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: Icon(Icons.sunny),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  fillColor: Theme.of(context).colorScheme.background,
                  filled: true,
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Popular Books Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "POPULAR BOOKS:",
                style: TextStyle(fontSize: 20),
              ),
            ),

            // Horizontal ListView for Popular Books
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          title: books[index]['title'],
                          author: books[index]['author'],
                          description: books[index]['description'],
                          imageUrl: books[index]['image'],
                        ),
                      ),
                    ),
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Book Image
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(books[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Book Title
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              books[index]['title'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),

                          // Favorite Button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: IconButton(
                              icon: Icon(
                                books[index]['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: books[index]['isFavorite']
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () => toggleFavorite(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 35,
            ),
            // Trending Books Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "TRENDING BOOKS:",
                style: TextStyle(fontSize: 20),
              ),
            ),

            // Horizontal ListView for Trending Books
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          title: books[index]['title'],
                          author: books[index]['author'],
                          description: books[index]['description'],
                          imageUrl: books[index]['image'],
                        ),
                      ),
                    ),
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Book Image
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(books[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Book Title
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              books[index]['title'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),

                          // Favorite Button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: IconButton(
                              icon: Icon(
                                books[index]['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: books[index]['isFavorite']
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () => toggleFavorite(index),
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
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle navigation based on index
          if (index == 1) {
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

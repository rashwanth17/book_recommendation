import 'package:book/Book.dart';
import 'package:book/BookDeatils.dart';
import 'package:book/Favourite.dart';
import 'package:book/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          "https://www.forewordreviews.com/books/covers/the-molecule-of-more.jpg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Science"
    },
    {
      "title": "Think Like a Monk",
      "author": "Jay Shetty",
      "description":
          "The book offers advice on how to live a more meaningful, balanced, and focused life.",
      "image":
          "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982134488/think-like-a-monk-9781982134488_hr.jpg",
      "isFavorite": false,
      "rating": 4.0,
      "genre": "Self-help"
    },
    {
      "title": "The Psychology of Money",
      "author": "Morgan Housel",
      "description":
          "This book teaches timeless lessons on wealth, greed, and happiness.",
      "image": "https://media.thuprai.com/front_covers/psychology-of-money.jpg",
      "isFavorite": false,
      "rating": 4.7,
      "genre": "Finance"
    },
    {
      "title": "The Subtle Art of Not Giving a F*ck",
      "author": "Mark Manson",
      "description":
          "This book offers a counterintuitive approach to living a good life by embracing limitations and focusing on what really matters.",
      "image":
          "https://i5.walmartimages.com/asr/3be5ebcf-c0c4-45b8-a49d-08baa6a14c87_1.636569a6333aa1529a0950793264911a.jpeg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Self-Help"
    }

    // Add more books here...
  ];

  String selectedGenre = 'All';
  bool sortByRating = false;
  String searchQuery = '';

  // Toggle the favorite status
  void toggleFavorite(int index) {
    setState(() {
      books[index]['isFavorite'] = !books[index]['isFavorite'];
    });
  }

  // Get filtered and sorted books based on selected genre and sorting
  List<Map<String, dynamic>> get filteredBooks {
    List<Map<String, dynamic>> filtered = books
        .where((book) =>
            (selectedGenre == 'All' || book['genre'] == selectedGenre) &&
            book['title']
                .toLowerCase()
                .contains(searchQuery.toLowerCase())) // Filter by search query
        .toList();

    if (sortByRating) {
      filtered.sort((a, b) => b['rating'].compareTo(a['rating']));
    }

    return filtered;
  }

  List<Map<String, dynamic>> get favoriteBooks =>
      books.where((book) => book['isFavorite']).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('READLY'),
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update search query
                    });
                  },
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary),
                      child: GestureDetector(
                        // style: ElevatedButton.styleFrom(
                        //   backgroundColor: Theme.of(context).colorScheme.primary,
                        // ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.green,
                                  ),
                                  height: 250,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        title: Text('All'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'All';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Science'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Science';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Self-help'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Self-help';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Finance'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Finance';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Center(
                          child: Text(
                            'Select Genre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          sortByRating = !sortByRating;
                        });
                      },
                      child: Text(
                        'Sort by Rating',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(
                              title: filteredBooks[index]['title'],
                              author: filteredBooks[index]['author'],
                              description: filteredBooks[index]['description'],
                              imageUrl: filteredBooks[index]['image'],
                            ),
                          ),
                        );
                      },
                      child: Book(
                        title: filteredBooks[index]['title'],
                        imageUrl: filteredBooks[index]['image'],
                        isFavorite: filteredBooks[index]['isFavorite'],
                        rating: filteredBooks[index]['rating'],
                        onFavoriteToggle: () {
                          toggleFavorite(books.indexOf(filteredBooks[index]));
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
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

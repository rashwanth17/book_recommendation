import 'package:flutter/material.dart';
import 'package:book/Book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of dummy book data
    final books = [
      {
        "title": "The Molecule of More",
        "image":
            "https://tse4.mm.bing.net/th?id=OIP.pjy7XSMg104j1TgZRu9-mAHaLK&pid=Api&P=0&h=180"
      },
      {
        "title": "Think Like a Monk",
        "image":
            "https://tse3.mm.bing.net/th?id=OIP.PoUdNGX14FatO70x8D5eRQAAAA&pid=Api&P=0&h=180"
      },
      {
        "title": "The Psychology of Money",
        "image":
            "https://tse4.mm.bing.net/th?id=OIP.518hVWocEw9J7sf9n00CywHaIq&pid=Api&P=0&h=180"
      },
      {"title": "Book 4", "image": "https://via.placeholder.com/100"},
      {"title": "Book 4", "image": "https://via.placeholder.com/100"},
      {"title": "Book 4", "image": "https://via.placeholder.com/100"},
      {"title": "Book 4", "image": "https://via.placeholder.com/100"},
      {"title": "Book 4", "image": "https://via.placeholder.com/100"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('READLY')),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'search..🔍',
                  fillColor: Colors.grey[200],
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "POPULAR BOOKS:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  // Passing book data to Book widget
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Book(
                      title: books[index]["title"]!,
                      imageUrl: books[index]["image"]!,
                    ),
                  );
                }),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "TRENDING BOOKS:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  // Passing book data to Book widget
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Book(
                      title: books[index]["title"]!,
                      imageUrl: books[index]["image"]!,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

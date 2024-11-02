// import 'package:book/Book.dart';
// import 'package:book/theme_provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class Novels extends StatefulWidget {
//   const Novels({super.key});
//
//   @override
//   State<Novels> createState() => _NovelsState();
// }
//
// class _NovelsState extends State<Novels> {
//   final List<Map<String, dynamic>> gotBooks = [
//     {
//       "title": "A Game of Thrones",
//       "rating": 4.5,
//       "image": "https://image-url.com/game-of-thrones.jpg",
//       "isFavorite": false,
//     },
//     {
//       "title": "A Clash of Kings",
//       "rating": 4.4,
//       "image": "https://image-url.com/clash-of-kings.jpg",
//       "isFavorite": false,
//     },
//     {
//       "title": "A Storm of Swords",
//       "rating": 4.6,
//       "image": "https://image-url.com/storm-of-swords.jpg",
//       "isFavorite": false,
//     },
//     {
//       "title": "A Feast for Crows",
//       "rating": 4.1,
//       "image": "https://image-url.com/feast-for-crows.jpg",
//       "isFavorite": false,
//     },
//     {
//       "title": "A Dance with Dragons",
//       "rating": 4.3,
//       "image": "https://image-url.com/dance-with-dragons.jpg",
//       "isFavorite": false,
//     },
//   ];
//
//   final List<Map<String, String>> quotes = [
//     {
//       "quote": "A reader lives a thousand lives before he dies.",
//       "author": "George R.R. Martin"
//     },
//     {
//       "quote": "There is no friend as loyal as a book.",
//       "author": "Ernest Hemingway"
//     },
//     {"quote": "So many books, so little time.", "author": "Frank Zappa"},
//     {"quote": "Books are a uniquely portable magic.", "author": "Stephen King"},
//     {
//       "quote": "Until I feared I would lose it, I never loved to read.",
//       "author": "Harper Lee"
//     }
//   ];
//
//   void toggleFavorite(int index) {
//     setState(() {
//       gotBooks[index]['isFavorite'] = !gotBooks[index]['isFavorite'];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'READLY',
//           style: TextStyle(fontStyle: FontStyle.italic),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.sunny),
//             onPressed: () {
//               Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           CarouselSlider(
//             items: quotes.map((item) {
//               return Container(
//                 width: 250,
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.background,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       item["quote"]!,
//                       style: TextStyle(fontSize: 12),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       "- ${item["author"]!}",
//                       style: TextStyle(fontSize: 10),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//             options: CarouselOptions(
//               height: 100,
//               viewportFraction: 0.8,
//               enableInfiniteScroll: true,
//               autoPlay: true,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text("aljefcbjqefgbjfj"), // Adding some space
//         ],
//       ),
//     );
//   }
// }

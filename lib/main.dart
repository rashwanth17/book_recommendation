import 'package:book/Favourite.dart';
import 'package:book/HomePage.dart';
import 'package:book/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   static const List<Widget> _pages = <Widget>[
//     HomePage(),
//     FavoritesPage(
//       favoriteBooks: [],
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: _pages[_selectedIndex],
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50), topRight: Radius.circular(50)),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 20,
//                       color: Colors.black,
//                     )
//                   ],
//                 ),
//                 child: SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 15.0, vertical: 8),
//                     child: GNav(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       gap: 2,
//                       rippleColor: Colors.grey,
//                       hoverColor: Colors.grey,
//                       activeColor: Colors.black,
//                       iconSize: 24,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 12),
//                       duration: const Duration(milliseconds: 400),
//                       tabBackgroundColor: Colors.white70,
//                       color: Colors.grey,
//                       tabs: const [
//                         GButton(
//                           icon: Icons.home,
//                           text: 'HOME',
//                         ),
//                         GButton(
//                           icon: Icons.favorite,
//                           text: 'FAVOURITE',
//                         ),
//                         // GButton(
//                         //   icon: Icons.send_sharp,
//                         //   text: 'PROFILE',
//                         // ),
//                       ],
//                       selectedIndex: _selectedIndex,
//                       onTabChange: _onItemTapped,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

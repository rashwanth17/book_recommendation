import 'package:book/Bot.dart';
import 'package:book/Explore.dart';
import 'package:book/Favourite.dart';
import 'package:book/HomePage.dart';
import 'package:book/Novels.dart';
import 'package:book/fav_provider.dart';
import 'package:book/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      // ChangeNotifierProvider(create: (context) => FavoritesModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    const HomePage(),
    BooksPage(),
    const Bot(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_selectedIndex],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              child: Container(
                // height: 50,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(colors: [
                  //   Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  //   Theme.of(context).colorScheme.primary.withOpacity(0.55),
                  // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black,
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: GNav(
                      mainAxisAlignment: MainAxisAlignment.center,
                      gap: 2,
                      rippleColor: Colors.redAccent,
                      hoverColor: Colors.red,
                      activeColor: Colors.black,
                      iconSize: 24,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey.withOpacity(0.9),
                      color: Colors.grey,
                      tabs: const [
                        GButton(
                          icon: Icons.home,
                          text: 'HOME',
                        ),
                        GButton(
                          icon: Icons.book,
                          text: 'EXPLORE',
                        ),
                        GButton(
                          icon: Icons.send_sharp,
                          text: 'BOT',
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: _onItemTapped,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//
//   void _onTabSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.blueAccent.withOpacity(0.5),
//               Colors.purpleAccent.withOpacity(0.5),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 10,
//               offset: Offset(0, -3),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           child: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.chat),
//                 label: 'Bot',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white54,
//             backgroundColor: Colors.transparent,
//             onTap: _onTabSelected,
//             type: BottomNavigationBarType.fixed,
//           ),
//         ),
//       ),
//     );
//   }
// }

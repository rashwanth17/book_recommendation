// import 'package:book/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class appBar extends StatefulWidget {
//   const appBar({super.key});
//
//   @override
//   State<appBar> createState() => _appBarState();
// }
//
// class _appBarState extends State<appBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text(
//         'READLY',
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.sunny),
//           onPressed: () {
//             Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//           },
//         ),
//       ],
//     );
//   }
// }

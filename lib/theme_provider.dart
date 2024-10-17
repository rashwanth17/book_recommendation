import 'package:book/theme.dart';
import 'package:flutter/material.dart';
import 'package:book/theme.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}

class IconSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the current theme
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightMode = themeProvider.themeData == lightmode;

    return Icon(
      isLightMode ? Icons.sunny : Icons.nightlight_round,
      color: isLightMode ? Colors.yellow : Colors.blueGrey,
    );
  }
}

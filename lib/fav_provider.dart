import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  List<Map<String, dynamic>> _favoriteBooks = [];

  List<Map<String, dynamic>> get favoriteBooks => _favoriteBooks;

  void toggleFavorite(Map<String, dynamic> book) {
    if (_favoriteBooks.contains(book)) {
      _favoriteBooks.remove(book);
    } else {
      _favoriteBooks.add(book);
    }
    notifyListeners();
  }
}

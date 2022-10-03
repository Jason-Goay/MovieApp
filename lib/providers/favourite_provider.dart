import 'package:flutter/material.dart';
import 'package:movie_app_artisan/model/movie_data_model.dart';
import 'package:provider/provider.dart';

class MovieData with ChangeNotifier {
  final String id;
  final String name;
  final String posterurl;
  final String? bannerurl;
  final String? description;
  final String? vote;

  MovieData(
      {required this.id,
      required this.name,
      required this.posterurl,
      this.bannerurl,
      this.description,
      this.vote});
}

class FavoriteProvider with ChangeNotifier {
  final List<MovieData> _items = [];
  bool isChecked = false;
  List<MovieData> get items {
    return [..._items];
  }

  void toggleFavorite(MovieData data) {
    if (isChecked) {
      _items.remove(data);
    } else {
      _items.add(data);
      isChecked = !isChecked;
    }
    notifyListeners();
  }

  bool isExist(MovieData data) {
    final isExist = _items.contains(data);
    return isExist;
  }

  void removeMovie(MovieData data) {
    _items.remove(data);
    isChecked = !isChecked;
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}

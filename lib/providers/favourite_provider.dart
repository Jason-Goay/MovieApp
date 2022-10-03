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
  final bool? isFav;

  MovieData(
      {required this.id,
      required this.name,
      required this.posterurl,
      this.bannerurl,
      this.description,
      this.vote,
      this.isFav});
}

class FavoriteProvider with ChangeNotifier {
  final List<MovieData> _items = [];
  final List<String> _itemsId = [];
  bool isChecked = false;
  List<MovieData> get items {
    return [..._items];
  }

  List<String> get itemsId {
    return [..._itemsId];
  }

  void toggleFavorite(MovieData data) {
    if (isChecked) {
      _items.remove(data);
      _itemsId.remove(data.id);
    } else {
      _items.add(data);
      _itemsId.add(data.id);
    }
    notifyListeners();
  }

  bool isExist(MovieData data) {
    final isExist = _itemsId.contains(data.id);
    return isExist;
  }

  void removeMovie(MovieData data) {
    _items.remove(data);
    _itemsId.remove(data.id);

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

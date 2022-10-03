import 'package:flutter/material.dart';
import 'package:movie_app_artisan/model/movie_data_model.dart';

class MovieDataProvider with ChangeNotifier {
  List<MovieData> _providerItem = [MovieData(id: '', name: '', posterurl: '')];

  List<MovieData> get providerItem {
    return [...providerItem];
  }
}

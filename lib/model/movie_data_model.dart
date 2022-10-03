import 'package:flutter/material.dart';

class MovieData with ChangeNotifier {
  final String? id;
  final String? name;
  final String? posterurl;

  MovieData({this.id, this.name, this.posterurl});
}

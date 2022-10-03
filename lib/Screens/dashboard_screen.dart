import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_artisan/Screens/favorite_movie_screen.dart';

import 'package:movie_app_artisan/widget/topRated_movie.dart';
import 'package:movie_app_artisan/widget/treading_movie.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'package:http/http.dart' as http;

class DashboardScreen extends StatelessWidget {
  static List _movies = [];
  static List _topRatedMovies = [];
  static List _popularMovies = [];
  static String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  static String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';

  static Future getMovieData() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    // Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    _movies = trendingresult['results'];
    _topRatedMovies = topratedresult['results'];
    // _popularMovies = tvresult['results'];

    var response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=9c9576f8c2e86949a3220fcc32ae2fb6',
    ));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      _movies = jsonData['results'];
      return _movies;
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  void initState() {
    getMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, FavoriteMovieScreen.routeName);
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: getMovieData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: Text('Loading...')),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TrendingMovies(
                        trending: _movies,
                      ),
                      TopRatedMovies(
                        toprated: _topRatedMovies,
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}

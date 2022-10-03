import 'package:flutter/material.dart';
import 'package:movie_app_artisan/Screens/favorite_movie_screen.dart';
import 'package:movie_app_artisan/providers/favourite_provider.dart';

import 'package:provider/provider.dart';
import './Screens/dashboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: DashboardScreen(),
        routes: {FavoriteMovieScreen.routeName: (ctx) => FavoriteMovieScreen()},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/Screens/movie_detail_screen.dart';
import './Screens/dashboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: DashboardScreen(),
        routes: {MovieDetailScreen.routeName: (ctx) => MovieDetailScreen()});
  }
}

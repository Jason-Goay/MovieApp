import 'package:flutter/material.dart';
import '../Screens/movie_detail_screen.dart';
import '../model/movie.dart';

class Top_List extends StatelessWidget {
  final int index;

  Top_List(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 160,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                MovieDetailScreen.routeName,
                arguments: {
                  'id': topRatedMovieList[index].id,
                  'title': topRatedMovieList[index].title,
                  'imageUrl': topRatedMovieList[index].imageUrl,
                  'rating': topRatedMovieList[index].rating,
                  'description': topRatedMovieList[index].description,
                  'year': topRatedMovieList[index].year,
                  'duration': topRatedMovieList[index].duration,
                },
              );
            },
            child: Card(
              elevation: 10,
              child: Hero(
                tag: topRatedMovieList[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(topRatedMovieList[index].imageUrl)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            topRatedMovieList[index].title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

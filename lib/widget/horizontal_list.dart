import 'package:flutter/material.dart';
import '../Screens/movie_detail_screen.dart';
import '../model/movie.dart';

class Horizontal_List extends StatelessWidget {
  final int index;

  Horizontal_List(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 160,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailScreen.routeName,
            arguments: {
              'id': movieList[index].id,
              'title': movieList[index].title,
              'imageUrl': movieList[index].imageUrl,
              'rating': movieList[index].rating,
              'description': movieList[index].description,
              'year': movieList[index].year,
              'duration': movieList[index].duration,
            },
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: movieList[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(movieList[index].imageUrl)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              movieList[index].title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

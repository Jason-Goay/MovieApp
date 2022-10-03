import 'package:flutter/material.dart';
import 'package:movie_app_artisan/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

// class MovieDetailArguments {
//   final String id, name, description, bannerurl, posterurl, vote;

//   const MovieDetailArguments({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.bannerurl,
//     required this.posterurl,
//     required this.vote,
//   });
// }

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie-details';
  // final MovieDetailArguments arguments;
  final String id, name, description, bannerurl, posterurl, vote;
  final int index;

  const MovieDetailScreen(
      {required this.id,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    bool isClicked = false;
    MovieData added = MovieData(
        name: name,
        posterurl: posterurl,
        id: id,
        description: description,
        vote: vote,
        bannerurl: bannerurl);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
            height: 250,
            child: SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                bannerurl,
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              '⭐ Average Rating - ' + vote,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            IconButton(
                onPressed: () {
                  provider.toggleFavorite(added);
                },
                // icon: provider.isChecked
                //     ? const Icon(Icons.favorite, color: Colors.red)
                //     : const Icon(Icons.favorite_border, color: Colors.white)),
                icon: provider.isChecked
                    ? Container()
                    : const Icon(Icons.favorite, color: Colors.red))
          ],
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(name,
                style: TextStyle(color: Colors.white, fontSize: 20))),
        Row(
          children: [
            Container(
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Text(description, style: TextStyle(color: Colors.white)),
            )),
          ],
        )
      ]),
    );
  }
}

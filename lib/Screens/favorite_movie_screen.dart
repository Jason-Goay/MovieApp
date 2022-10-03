import 'package:flutter/material.dart';
import 'package:movie_app_artisan/Screens/movie_detail_screen.dart';
import 'package:movie_app_artisan/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteMovieScreen extends StatelessWidget {
  static const routeName = '/favorite-movie';
  const FavoriteMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: provider.items.length,
        itemBuilder: (context, ind) {
          return ListTile(
            title: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                              id: provider.items[ind].id,
                              name: provider.items[ind].name,
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500${provider.items[ind].bannerurl}',
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500${provider.items[ind].posterurl}',
                              description:
                                  provider.items[ind].description.toString(),
                              vote: provider.items[ind].vote.toString(),
                            )));
              },
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 100,
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500${provider.items[ind].posterurl}'),
                  ),
                  Text(provider.items[ind].name),
                ],
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                MovieData added = MovieData(
                  name: provider.items[ind].name,
                  posterurl: provider.items[ind].posterurl,
                  id: provider.items[ind].id,
                  bannerurl: provider.items[ind].bannerurl,
                  description: provider.items[ind].description,
                  vote: provider.items[ind].vote,
                );
                provider.removeMovie(provider.items[ind]);
              },
              icon: provider.isExist(provider.items[ind])
                  ? const Icon(Icons.delete, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}

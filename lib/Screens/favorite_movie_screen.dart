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
        itemBuilder: (context, index) {
          return ListTile(
            title: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                              id: provider.items[index].id,
                              name: provider.items[index].name,
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500${provider.items[index].bannerurl}',
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500${provider.items[index].posterurl}',
                              description:
                                  provider.items[index].description.toString(),
                              vote: provider.items[index].vote.toString(),
                              index: index,
                            )));
              },
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 100,
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500${provider.items[index].posterurl}'),
                  ),
                  Text(provider.items[index].name),
                ],
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                MovieData added = MovieData(
                  name: provider.items[index].name,
                  posterurl: provider.items[index].posterurl,
                  id: provider.items[index].id,
                  bannerurl: provider.items[index].bannerurl,
                  description: provider.items[index].description,
                  vote: provider.items[index].vote,
                );
                provider.removeMovie(provider.items[index]);
              },
              icon: provider.isExist(provider.items[index])
                  ? const Icon(Icons.delete, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}

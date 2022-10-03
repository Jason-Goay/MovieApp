import 'package:flutter/material.dart';
import 'package:movie_app_artisan/Screens/movie_detail_screen.dart';

class RecommandMovies extends StatelessWidget {
  final List recommand;

  const RecommandMovies({Key? key, required this.recommand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recommanded Movies',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommand.length,
                  itemBuilder: (context, index) {
                    if (recommand[index]['title'].toString() == null &&
                        recommand[index]['title'] == null &&
                        recommand[index]['poster_path'] == null &&
                        recommand[index]['overview'] == null &&
                        recommand[index]['vote_average'] == null &&
                        recommand[index]['release_date'] == null) {
                      return Container(
                        child: Text("Loading..."),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                      id: recommand[index]['id'].toString(),
                                      name: recommand[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              recommand[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              recommand[index]['poster_path'],
                                      description: recommand[index]['overview'],
                                      vote: recommand[index]['vote_average']
                                          .toString(),
                                    )));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          recommand[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(recommand[index]['title'] != null
                                  ? recommand[index]['title']
                                  : 'Loading'),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

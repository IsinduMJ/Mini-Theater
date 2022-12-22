import 'package:flutter/material.dart';
import 'package:mini_theater/utils/colors.dart';
import 'package:mini_theater/views/home_page/home_page.dart';
import 'package:mini_theater/views/movie_grid/movie_grid_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 6,
            ),
            ListTile(
              leading: const Icon(Icons.home, color: white),
              title: const Text(
                'Home',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie, color: white),
              title: const Text(
                'Now Screening',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieGridPage(
                        title: 'Now Screening',
                        movieType: 'now_playing',
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: white),
              title: const Text(
                'Popular',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieGridPage(
                        title: 'Popular  Movies',
                        movieType: 'popular',
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star, color: white),
              title: const Text(
                'Top Rating',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieGridPage(
                        title: 'Top Rated  Movies',
                        movieType: 'top_rated',
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.new_releases, color: white),
              title: const Text(
                'Upcoming',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieGridPage(
                        title: 'Upcoming  Movies',
                        movieType: 'upcoming',
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

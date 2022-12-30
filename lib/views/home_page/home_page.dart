import 'package:flutter/material.dart';
import 'package:mini_theater/components/see_more_button.dart';
import 'package:mini_theater/components/title_text.dart';
import 'package:mini_theater/views/home_page/header/header_slider.dart';
import 'package:mini_theater/views/movie_grid/movie_grid_page.dart';
import 'package:mini_theater/views/navigation_drawer/navigation_drawer.dart';
import 'package:mini_theater/views/search_page/search_bar.dart';

import 'movie_slider/movie_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Searchbar();
                    },
                  ),
                );
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              HeaderSlider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 12.5, right: 15, bottom: 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleText(title: 'Popular Movies', fontSize: 22),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MovieGridPage(
                                title: 'Popular Movies',
                                movieType: 'popular',
                              );
                            },
                          ),
                        );
                      },
                      child: const SeeMoreButton(),
                    ),
                  ],
                ),
              ),
              MovieSlider(
                movieType: 'popular',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 12.5, right: 15, bottom: 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleText(title: 'Top Rated Movies', fontSize: 22),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MovieGridPage(
                                title: 'Top Rated Movies',
                                movieType: 'top_rated',
                              );
                            },
                          ),
                        );
                      },
                      child: const SeeMoreButton(),
                    ),
                  ],
                ),
              ),
              MovieSlider(
                movieType: 'top_rated',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 12.5, right: 15, bottom: 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleText(title: 'Upcoming Movies', fontSize: 22),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MovieGridPage(
                                title: 'Upcoming Movies',
                                movieType: 'upcoming',
                              );
                            },
                          ),
                        );
                      },
                      child: const SeeMoreButton(),
                    ),
                  ],
                ),
              ),
              MovieSlider(
                movieType: 'upcoming',
              ),
            ],
          ),
        ),
        drawer: const NavigationDrawer(),
      ),
    );
  }
}

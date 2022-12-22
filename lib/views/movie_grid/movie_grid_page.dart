import 'package:flutter/material.dart';
import 'package:mini_theater/components/title_text.dart';
import 'package:mini_theater/utils/colors.dart';
import 'package:mini_theater/views/movie_grid/movie_grid.dart';
import 'package:mini_theater/views/navigation_drawer/navigation_drawer.dart';
import 'package:mini_theater/views/search_page/search_bar.dart';
import 'package:mini_theater/views/search_page/search_results.dart';

class MovieGridPage extends StatelessWidget {
  MovieGridPage({required this.title, required this.movieType, super.key});

  dynamic title, movieType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: title,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
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
      body: MovieGrid(
        movieType: movieType,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

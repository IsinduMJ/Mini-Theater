import 'package:flutter/material.dart';
import 'package:mini_theater/utils/colors.dart';
import 'package:mini_theater/views/movie_grid/movie_grid_page.dart';
import 'package:mini_theater/views/search_page/search_results.dart';

class Searchbar extends StatelessWidget {
  Searchbar({super.key});

  TextEditingController searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  height: 50,
                  width: size.width * 0.875,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: white.withOpacity(0.25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: size.width * 0.7,
                        child: TextFormField(
                          controller: searchQuery,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: white.withOpacity(0.7),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: white.withOpacity(0.85),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SearchResults(
                                      query: searchQuery.text,
                                    );
                                  },
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              // color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

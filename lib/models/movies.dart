import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Movies {
  dynamic backdrop_path;
  dynamic id;
  dynamic original_language;
  dynamic original_title;
  dynamic overview;
  dynamic popularity;
  dynamic poster_path;
  dynamic release_date;
  dynamic title;
  dynamic vote_average;
  dynamic vote_count;

  Movies({
    required this.backdrop_path,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });

  factory Movies.fromJson(Map<String, dynamic> movieDataJson) {
    return Movies(
      backdrop_path: movieDataJson['backdrop_path'],
      id: movieDataJson['id'],
      original_language: movieDataJson['original_language'],
      original_title: movieDataJson['original_title'],
      overview: movieDataJson['overview'],
      popularity: movieDataJson['popularity'],
      poster_path: movieDataJson['poster_path'],
      release_date: movieDataJson['release_date'],
      title: movieDataJson['title'],
      vote_average: movieDataJson['vote_average'],
      vote_count: movieDataJson['vote_count'],
    );
  }
}

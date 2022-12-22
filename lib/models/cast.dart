class Cast {
  String name;
  String character;
  dynamic profile_path;
  double popularity;
  int order;

  Cast({
    required this.name,
    required this.character,
    required this.profile_path,
    required this.popularity,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> movieCastJson) {
    return Cast(
      name: movieCastJson['name'],
      character: movieCastJson['character'],
      profile_path: movieCastJson['profile_path'],
      popularity: movieCastJson['popularity'],
      order: movieCastJson['order'],
    );
  }
}

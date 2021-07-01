class MovieSearch {
  final int id;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  MovieSearch(this.id, this.title, this.backPoster, this.poster, this.overview,
      this.rating);

  MovieSearch.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}

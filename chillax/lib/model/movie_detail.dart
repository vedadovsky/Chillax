class MovieDetail {
  final int id;
  final bool adult;
  final int budget;
  final String releaseDate;
  final int runtime;

  MovieDetail(this.id, this.adult, this.budget, this.releaseDate, this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        releaseDate = json["release_date"],
        runtime = json["runtime"];
}

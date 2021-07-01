class TVDetail {
  final int id;
  final bool adult;
  final int budget;
  final String releaseDate;
  final int runtime;

  TVDetail(this.id, this.adult, this.budget, this.releaseDate, this.runtime);

  TVDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        releaseDate = json["release_date"],
        runtime = json["runtime"];
}

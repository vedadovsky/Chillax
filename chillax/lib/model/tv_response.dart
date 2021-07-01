import 'tv.dart';

class TVResponse {
  final List<TV> tvs;
  final String error;

  TVResponse(this.tvs, this.error);

  TVResponse.fromJson(Map<String, dynamic> json)
      : tvs = (json["results"] as List).map((i) => new TV.fromJson(i)).toList(),
        error = "";

  TVResponse.withError(String errorValue)
      : tvs = List(),
        error = errorValue;
}

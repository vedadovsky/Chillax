import 'dart:convert';
import 'package:movie_app/model/movie_search.dart';
import 'package:http/http.dart' as http;

Future<MovieSearch> getMovieSearch() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?api_key=89eef3426d167c3c8145a257ebe68357&query='));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieSearch.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies');
  }
}

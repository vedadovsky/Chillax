import 'package:dio/dio.dart';
import 'package:movie_app/model/movie_detail_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/tv_detail_response.dart';
import 'package:movie_app/model/tv_response.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String apiKey = "89eef3426d167c3c8145a257ebe68357";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  //Movies
  var getPopularMovieUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingMoviesUrl = '$mainUrl/movie/now_playing';
  var movieUrl = "$mainUrl/movie";
  var movieSearch = "$mainUrl/search/movie";

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPopularMovieUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<http.Response> getMovieSearch() {
    return http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=89eef3426d167c3c8145a257ebe68357&query='));
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }
}

class TVRepository {
  final String apiKey = "89eef3426d167c3c8145a257ebe68357";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  //TV series
  var getPopularTVUrl = '$mainUrl/tv/top_rated';
  var getTvUrl = '$mainUrl/discover/tv';
  var getPlayingTVUrl = '$mainUrl/tv/airing_today';
  var tvUrl = "$mainUrl/tv";

  Future<TVResponse> getTV() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPopularTVUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<TVResponse> getPlayingTV() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingTVUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<TVDetailResponse> getTVDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(tvUrl + "/$id", queryParameters: params);
      return TVDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TVDetailResponse.withError("$error");
    }
  }
}

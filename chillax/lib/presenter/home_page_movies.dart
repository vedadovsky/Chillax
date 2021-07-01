import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_search.dart';
import 'package:movie_app/arch/get_movies.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/movie_search_response.dart';
import 'package:movie_app/view/now_playing_movie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/view/now_playing_tv.dart';
import 'package:movie_app/view/top_movies.dart';
import 'package:movie_app/view/top_tvs.dart';
import '../style/style.dart';

class HomePageMovie extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<MovieSearch> movieSearch;

void initState() {
  initState();
  movieSearch = getMovieSearch();
  movies..getMovies();
}

class _HomePageState extends State<HomePageMovie> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF151336),
        appBar: AppBar(
          backgroundColor: Color(0xFF151336),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                logo,
                height: 195,
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: Icon(
                  EvaIcons.searchOutline,
                  color: Colors.white,
                ))
          ],
          titleSpacing: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(75.0),
            child: TabBar(
                indicatorColor: Color(0xFFf4C10F),
                indicatorWeight: 4.0,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.movie),
                    child: Text(
                      "Movies",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.live_tv),
                    child: Text(
                      "TV Shows",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  )
                ]),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[NowPlayingMovies(), BestMovie()],
            ),
            ListView(
              children: <Widget>[
                NowPlayingTV(),
                BestTV(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Search

class DataSearch extends SearchDelegate<String> {
  final dummyQuery = [
    "Movie 1",
    "Movie 2",
    "Movie 3",
    "Movie 4",
    "Movie 5",
    "Movie 6",
    "Movie 7",
    "Movie 8",
    "movie 9",
    "movie 10",
    "movie 11",
    "movie 12",
    "movie 13",
  ];
  final moviess = [movieSearch];
  final recent = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //nesta
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesstionList = query.isEmpty ? recent : moviess;

    return ListView.builder(
      itemBuilder: (context, index) {
        if (suggesstionList == null) {
          print('suggesstionList is null');
          print('query is $query');
          print('recent is $recent');
          print('moviess is moviess');
          return Text('Oops, something went wrong');
        }
        print('suggesstionList type: ${suggesstionList.runtimeType}');
        print('suggesstionList length: ${suggesstionList.length}');
        return SizedBox(
          height: 150,
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.movie),
              title: RichText(
                  text: TextSpan(
                      text: suggesstionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggesstionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
            ),
            itemCount: 10,
          ),
        );
      },
      itemCount: suggesstionList != null ? suggesstionList.length : 1,
    );
  }
}

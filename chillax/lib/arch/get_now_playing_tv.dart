import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/tv_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingList {
  final TVRepository _repository = TVRepository();
  final BehaviorSubject<TVResponse> _subject = BehaviorSubject<TVResponse>();

  getTV() async {
    TVResponse response = await _repository.getPlayingTV();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TVResponse> get subject => _subject;
}

final nowPlayingTV = NowPlayingList();

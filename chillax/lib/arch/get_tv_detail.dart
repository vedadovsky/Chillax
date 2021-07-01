import 'package:movie_app/model/tv_detail_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TVDetail {
  final TVRepository _repository = TVRepository();
  final BehaviorSubject<TVDetailResponse> _subject =
      BehaviorSubject<TVDetailResponse>();

  getTVDetail(int id) async {
    TVDetailResponse response = await _repository.getTVDetail(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<TVDetailResponse> get subject => _subject;
}

final tvDetail = TVDetail();

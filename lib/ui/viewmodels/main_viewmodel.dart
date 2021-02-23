import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learflutter/data/models/chart.dart';
import 'package:learflutter/data/models/favorite.dart';
import 'package:learflutter/data/models/response.dart';
import 'package:learflutter/data/models/video.dart';
import 'package:learflutter/data/service/network_service.dart';
import 'package:learflutter/utils/show_snackbar.dart';

class MainViewmodel extends ChangeNotifier {
  //properties of Main viewmodel
  List<Chart> _charts;
  List<Favorite> _favorites;
  List<Video> _videos;

  final NetworkService _networkService = NetworkService.instance;

  //properties getter
  List<Chart> get charts => _charts;
  List<Favorite> get favorites => _favorites;
  List<Video> get videos => _videos;

  Future loadCharts() async {
    _charts = await _networkService.getCharts();
    notifyListeners();
  }

  Future loadFavorite() async {
    _favorites = await _networkService.getFavorite();
    notifyListeners();
  }

  Future updateFavorite(BuildContext context, String _videoId) async {
    String _message;
    ResponseDefault result = await _networkService.updateFavorite(_videoId);
    _message = result.data['message'];
    loadFavorite();
    showSnackbar(context, _message ?? 'error occured');
  }

  Future loadVideos() async {
    _videos = await _networkService.getPlaylist();
    debugPrint(_videos.first.toJson().toString());
    notifyListeners();
  }

  List<Video> getFavoriteVideos() {
    return _videos
        .where(
          (element) => isFavoriteVideo(element.contentDetails.videoId),
        )
        .toList();
  }

  bool isFavoriteVideo(String videoId) {
    List<String> _favoritesIdVideo = _favorites
        .map<String>(
          (e) => e.videoId,
        )
        .toList();
    return _favoritesIdVideo.contains(videoId);
  }
}

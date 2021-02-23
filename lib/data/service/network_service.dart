import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learflutter/data/models/chart.dart';
import 'package:learflutter/data/models/favorite.dart';
import 'package:learflutter/data/models/profile.dart';
import 'package:learflutter/data/models/response.dart';
import 'package:learflutter/data/models/video.dart';
import 'package:learflutter/data/service/local_service.dart';

abstract class BaseNetworkService {
  Future<ResponseDefault> loginUser(String _email, String password);
  Future<ResponseDefault> registerUser(String _email, String password);
  Future<List<Video>> getPlaylist();
  Future<List<Chart>> getCharts();
  Future<Profile> getProfile();
  Future<ResponseDefault> updateProfile(Profile _profile);
  Future<ResponseDefault> updateFavorite(String _videoId);
  Future<List<Favorite>> getFavorite();
}

class NetworkService extends BaseNetworkService {
  //implement singleton
  static final NetworkService _networkService = NetworkService._internal();

  factory NetworkService() => _networkService;

  NetworkService._internal();
  
  //create instance property
  static final instance = NetworkService();

  static const String BASEURL = "http://192.168.43.150/";
  static const String APIPLAYLISTURL =
      "https://submisiintermediatebatch4udaco.herokuapp.com";
  static const String FAVORITEPATH = "favorite";
  static const String PROFILEPATH = "profile";
  static const String LOGINPATH = "auth/login";
  static const String CHARTPATH = "chart";
  static const String REGISTERPATH = "auth/register";
  static const int TIMEOUT = 5000;
  final _localService = LocalService();
  final _dioPlaylist = Dio(
    BaseOptions(
      connectTimeout: TIMEOUT+5000,
      receiveTimeout: TIMEOUT+5000,
    ),
  );
  final _dio = Dio(
    BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: TIMEOUT,
      receiveTimeout: TIMEOUT,
    ),
  );

  @override
  Future<ResponseDefault> loginUser(String _email, String password) async {
    try {
      var formdata = FormData.fromMap({'email': _email, 'password': password});
      var response = await _dio.post(LOGINPATH, data: formdata);
      if (response.statusCode == 200) {
        return ResponseDefault.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ResponseDefault(
        status: 522, error: true, data: {'message': "time out"});
  }

  @override
  Future<ResponseDefault> registerUser(String email, String password) async {
    try {
      var formdata = FormData.fromMap({'email': email, 'password': password});
      var response = await _dio.post(REGISTERPATH, data: formdata);
        // debugPrint(response.data.toString());
      debugPrint(formdata.fields.toString());
      
      if (response.statusCode == 200) {
        return ResponseDefault.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ResponseDefault(
        status: 522, error: true, data: {'message': "time out"});
  }

  @override
  Future<List<Video>> getPlaylist() async {
    try {
      var response = await _dioPlaylist.get(APIPLAYLISTURL);

      if (response.statusCode == 200) {
        return List<Video>.from(response.data.map((x) => Video.fromJson(x)));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return <Video>[];
  }

  @override
  Future<List<Chart>> getCharts() async {
    try {
      var response = await _dio.get('$CHARTPATH');

      if (response.statusCode == 200) {
        return chartFromJson(jsonEncode(response.data));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  @override
  Future<List<Favorite>> getFavorite() async {
    String _email = await _localService.getEmail();

    try {
      if (_email != null) {
        var response = await _dio.get('$FAVORITEPATH/byUserEmail/$_email');

        if (response.statusCode == 200) {
          return favoriteFromJson(jsonEncode(response.data));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  @override
  Future<Profile> getProfile() async {
    String _uid = await _localService.getUID();

    try {
      if (_uid != null) {
        var response = await _dio.get('$PROFILEPATH/profile/$_uid');

        if (response.statusCode == 200) {

          return Profile.fromJson(response.data);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<ResponseDefault> updateFavorite(String _videoId) async {
    String _email = await _localService.getEmail();

    try {
      if (_email != null) {
        var formdata = FormData.fromMap({'video_id': _videoId});
        var response = await _dio.post('$FAVORITEPATH/update/$_email', data: formdata);

        if (response.statusCode == 200) {
          return ResponseDefault.fromJson(response.data);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ResponseDefault(
        status: 522, error: true, data: {'message': "time out"});
  }

  @override
  Future<ResponseDefault> updateProfile(Profile _profile) async {
    try {
      if (_profile.id != null) {
        Map<String, dynamic> json = (_profile.toJson()
          ..removeWhere((key, value) => value == null || value is! String));

        String path = "profile/update/${_profile.id}";

        var response = await _dio.post(path, data: FormData.fromMap(json));
        if (response.statusCode == 200) {
          var json = response.data;
          return ResponseDefault.fromJson(json);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ResponseDefault(
        status: 522, error: true, data: {'message': "time out"});
  }
}

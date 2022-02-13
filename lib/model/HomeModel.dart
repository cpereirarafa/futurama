import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:futurama/utils/network_utils.dart';

class HomeModel extends ChangeNotifier {

  final NetworkUtils _networkUtils = NetworkUtils();
  final List<Info> _info = [];

  UnmodifiableListView<Info> get items => UnmodifiableListView(_info);

  HomeModel() {
    getHomeTexts();
  }

  void getHomeTexts() async {

    _clearInfo();
    _getTexts();
    notifyListeners();
  }

  Future<void> _getTexts() async {

    List<dynamic> results = [];
    dynamic res = await _networkUtils.get("https://api.sampleapis.com/futurama/info");

    if(res.runtimeType == List<dynamic>){

      results = res;
    }

    results.forEach((element) {

      List<Map<String, String>> creatorList = [];

      if(element["creators"].runtimeType == List<dynamic>){

        (element["creators"] as List<dynamic>).forEach((creator) {

          creatorList.add(Map<String, String>.from(creator));
        });
      }

      Info _newInfo = Info(element["synopsis"] ?? "", element["yearsAired"] ?? "", creatorList);
      _info.add(_newInfo);
    });

    notifyListeners();
  }

  void _clearInfo() {
    _info.clear();
  }
}

class Info {

  String _synopsis = "";
  String _yearsAired = "";
  List<Map<String, String>> _author = [];

  Info(this._synopsis, this._yearsAired, this._author);

  String get synopsis => _synopsis;
  String get yearsAired => _yearsAired;
  List<Map<String, String>> get author => _author;

  set synopsis(String value) {
    _synopsis = value;
  }

  set yearsAired(String value) {
    _yearsAired = value;
  }

  set author(List<Map<String, String>> value) {
    _author = value;
  }
}
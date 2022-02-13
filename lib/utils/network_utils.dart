import 'dart:async';

import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import '../strings/strings_en.dart';

class NetworkUtils{

  static final NetworkUtils _instance = NetworkUtils.internal();
  NetworkUtils.internal();
  factory NetworkUtils() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(String address) async {

    Uri url = Uri.parse(address);

    if(await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      return http.get(url).then((http.Response response) {

        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400) {
          throw Exception(res);
        }

        return _decoder.convert(res);
      });
    } else {
      throw Exception(jsonEncode(Map<String, String>.fromEntries([const MapEntry(MESSAGE_JSON_HEADER, " Network error")])));
    }
  }
}
import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../utils/network_utils.dart';

class CharacterModel extends ChangeNotifier {

  final NetworkUtils _networkUtils = NetworkUtils();
  final List<Character> _character = [];

  UnmodifiableListView<Character> get characters => UnmodifiableListView(_character);

  CharacterModel() {
    getCharacters();
  }

  void getCharacters() async {

    _clearCharacters();
    _getCharacter();
    notifyListeners();
  }

  Future<void> _getCharacter() async {

    List<dynamic> results = [];
    dynamic res = await _networkUtils.get("https://api.sampleapis.com/futurama/characters");

    if(res.runtimeType == List<dynamic>){

      results = res;
    }

    results.forEach((element) {

      String _name = "${element["name"]["first"]} ${element["name"]["middle"]} ${element["name"]["last"]}";
      String _photo = "${element["images"]["main"]}";

      List<String> sayList = [];

      if(element["sayings"].runtimeType == List<dynamic>){

        (element["sayings"] as List<dynamic>).forEach((say) {

          sayList.add(say.toString());
        });
      }

      Character _newCharacter = Character(_name,
          element["gender"] ?? "",
          element["species"] ?? "",
          element["homePlanet"] ?? "",
          element["occupation"] ?? "",
          _photo,
          int.tryParse(element["age"]) ?? 0,
          sayList);
      _character.add(_newCharacter);
    });

    notifyListeners();
  }

  void _clearCharacters() {
    _character.clear();
  }
}

class Character {

  String _name = "";
  String _gender = "";
  String _species = "";
  String _planet = "";
  String _occupation = "";
  String _photo = "";
  int _age = 0;
  List<String> _sayings = [];

  Character(this._name, this._gender, this._species, this._planet,
      this._occupation, this._photo, this._age, this._sayings);

  List<String> get sayings => _sayings;
  int get age => _age;
  String get occupation => _occupation;
  String get planet => _planet;
  String get species => _species;
  String get gender => _gender;
  String get name => _name;
  String get photo => _photo;

  set sayings(List<String> value) {
    _sayings = value;
  }

  set age(int value) {
    _age = value;
  }

  set occupation(String value) {
    _occupation = value;
  }

  set planet(String value) {
    _planet = value;
  }

  set species(String value) {
    _species = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set name(String value) {
    _name = value;
  }

  set photo(String value) {
    _photo = value;
  }
}
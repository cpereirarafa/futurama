import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../utils/network_utils.dart';

class QuizModel extends ChangeNotifier {

  final NetworkUtils _networkUtils = NetworkUtils();
  final List<Question> _questions = [];

  UnmodifiableListView<Question> get questions => UnmodifiableListView(_questions);

  QuizModel() {
    getQuestions();
  }

  void getQuestions() async {

    _clearQuestions();
    _getQuestion();
    notifyListeners();
  }

  Future<void> _getQuestion() async {

    List<dynamic> results = [];
    dynamic res = await _networkUtils.get("https://api.sampleapis.com/futurama/questions");

    if(res.runtimeType == List<dynamic>){

      results = res;
    }

    results.forEach((element) {

      List<String> answerList = [];

      if(element["possibleAnswers"].runtimeType == List<dynamic>){

        (element["possibleAnswers"] as List<dynamic>).forEach((answer) {

          answerList.add(answer.toString());
        });
      }

      Question _newQuestion = Question(
          element["question"] ?? "",
          element["correctAnswer"] ?? "",
          answerList);
      _questions.add(_newQuestion);
    });

    notifyListeners();
  }

  void _clearQuestions() {
    _questions.clear();
  }
}

class Question {

  String _question = "";
  dynamic _correctAnswer = "";
  List<String> _possibleAnswers = [];

  Question(this._question, this._correctAnswer, this._possibleAnswers);

  List<String> get possibleAnswers => _possibleAnswers;
  dynamic get correctAnswer => _correctAnswer;
  String get question => _question;

  set possibleAnswers(List<String> value) {
    _possibleAnswers = value;
  }

  set correctAnswer(dynamic value) {
    _correctAnswer = value;
  }

  set question(String value) {
    _question = value;
  }
}

import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';

import 'interfaces/character_interface.dart';
import 'interfaces/home_interface.dart';
import 'interfaces/quiz_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int _bottomBarOption = 0;

  static int get bottomBarOption => _bottomBarOption;

  static set bottomBarOption(int value) {
    _bottomBarOption = value;
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeInterface(),
      routes: <String, WidgetBuilder> {
        '/home_interface': (BuildContext context) => HomeInterface(),
        '/characters_interface': (BuildContext context) => CharactersInterface(),
        '/quiz_interface' : (BuildContext context) => QuizInterface(),
      },
    );
  }
}


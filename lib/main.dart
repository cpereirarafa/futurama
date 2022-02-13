import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';
import 'package:provider/provider.dart';

import 'interfaces/character_interface.dart';
import 'interfaces/home_interface.dart';
import 'interfaces/quiz_interface.dart';
import 'model/HomeModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int _bottomBarOption = 0;

  static int get bottomBarOption => _bottomBarOption;

  static set bottomBarOption(int value) {
    _bottomBarOption = value;
  } // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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


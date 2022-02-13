import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';

import '../main.dart';

class BottomBarInterface extends StatefulWidget{

  @override
  State<BottomBarInterface> createState() => _BottomBarInterfaceState();
}

class _BottomBarInterfaceState extends State<BottomBarInterface> {

  void _onItemTapped(int index) {
    switch (index){
      case 0:
        Navigator.popAndPushNamed(context, '/home_interface');
        break;

      case 1:
        Navigator.popAndPushNamed(context, '/characters_interface');
        break;

      case 2:
        Navigator.popAndPushNamed(context, '/quiz_interface');
        break;
    }

    setState(() {
      MyApp.bottomBarOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: BUTTON_HOME,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: BUTTON_CHARACTERS,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz_sharp),
          label: BUTTON_QUIZ,
        ),
      ],
        currentIndex: MyApp.bottomBarOption,
        selectedItemColor: Colors.red[400],
        onTap: _onItemTapped,
      );
  }
}
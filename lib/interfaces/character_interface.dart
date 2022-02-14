import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';
import 'package:provider/provider.dart';

import '../model/CharacterModel.dart';
import 'bottom_bar_interface.dart';

class CharactersInterface extends StatefulWidget{

  @override
  _CharactersInterfaceState createState() => _CharactersInterfaceState();
}

class _CharactersInterfaceState extends State<CharactersInterface> {

  @override
  Widget build(BuildContext context) {

    return ListenableProvider(create: (context) => CharacterModel(),
     child: Scaffold(
      appBar: AppBar(
        title: const Text(CHARACTERS_TITLE),
          centerTitle: true,
        ),
        body: Center(
          child: _CharacterInfo(),
        ),
        bottomNavigationBar: BottomBarInterface(),
      )
    );
  }
}

class _CharacterInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterModel>(
        builder: (context, info, child){
          if(info.characters.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(info.characters.first.photo,),

                  Text(info.characters.first.name.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center
              ),
            );
          }
        }
    );
  }
}

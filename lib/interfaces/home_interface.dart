import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';
import 'package:provider/provider.dart';

import '../model/HomeModel.dart';
import 'bottom_bar_interface.dart';

class HomeInterface extends StatefulWidget{

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ListenableProvider(create: (context) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(HOME_TITLE),
            centerTitle: true,
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: _HomeInfo(),
        ),
        bottomNavigationBar: BottomBarInterface(),
      )
    );
  }
}

class _HomeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
      builder: (context, info, child){
        if(info.items.isEmpty) {
          return const CircularProgressIndicator();
        } else {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text(info.items.first.synopsis,
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(height: 20,),
                  Text(AIRED_SERIE + info.items.first.yearsAired,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              width: 310,
            )
          );
        }
      }
    );
  }
}
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
    return ListenableProvider(create: (context) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
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
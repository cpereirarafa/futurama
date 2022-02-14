import 'package:flutter/material.dart';
import 'package:futurama/strings/strings_en.dart';
import 'package:provider/provider.dart';

import '../model/QuizModel.dart';
import 'bottom_bar_interface.dart';

class QuizInterface extends StatefulWidget{

  @override
  _QuizInterfaceState createState() => _QuizInterfaceState();
}

class _QuizInterfaceState extends State<QuizInterface> {

  @override
  Widget build(BuildContext context) {

    return ListenableProvider(create: (context) => QuizModel(),
      child:Scaffold(
        appBar: AppBar(
          title: const Text(QUIZ_TITLE),
          centerTitle: true,
        ),
        body: Center(
          child: _QuizScreen(),
        ),
        bottomNavigationBar: BottomBarInterface(),
      )
    );
  }
}

class _QuizScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizModel>(
        builder: (context, info, child){
          if(info.questions.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                  children: [
                    Text(info.questions.first.question,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appquizz_flutter/screen/quiz/quiz_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuizScreen())
              );
            },
            icon: Icon(Icons.arrow_forward),
            label: Text("Start")
        ),
      )
    );
  }

}
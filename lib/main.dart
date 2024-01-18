import 'package:flutter/material.dart';
import 'package:appquizz_flutter/screen/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      home: HomeScreen(),
    );
  }

}

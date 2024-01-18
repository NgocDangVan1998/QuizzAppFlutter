import 'package:appquizz_flutter/Data/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appquizz_flutter/Data/question.dart';
import 'package:appquizz_flutter/screen/result/result_screen.dart';
class QuizScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final Map<int,dynamic> _answer = {};
  @override
  Widget build(BuildContext context) {
    final question = questionsData[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZZ',style: TextStyle(fontFamily: 'RobotoMono',fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Text("${_currentIndex + 1}"),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(child: Text(question.question))
              ],
            ),
            Card(
              child: Column(
                children: [
                  ...question.options.map((option) => RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _answer[_currentIndex],
                      onChanged: (value) {
                       setState(() {
                         _answer[_currentIndex] = option;
                       });
                      }
                  ))
                ],
              ),
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                      onPressed: _handleNext,
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Next')
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
  void _handleNext(){
    if(_answer[_currentIndex] == null){
      _showAlertDialog();
      return;
    }
    if(_currentIndex < (questionsData.length - 1)){
      setState(() {
        _currentIndex++;
      });
    }
    else{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => QuizResultScreen(answer:_answer))
      );
    }
  }

  void _showAlertDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Warning"),
          content: const Text("Bắt buộc chọn câu trả lời"),
          actions: <Widget>[
            TextButton(
                onPressed: (){
                  Navigator.pop(context,'OK');
                },
                child: const Text('OK')
            )
          ],
        )
    );
  }
}
import 'package:appquizz_flutter/Data/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckAnswerScreen extends StatelessWidget{
  final Map<int,dynamic> answer;
  const CheckAnswerScreen(this.answer);
  @override
  Widget build(BuildContext context) {
    final List<Question> questions = questionsData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Answer",style: TextStyle(fontFamily: 'RobotoMono',fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: questions.length + 1,
          itemBuilder: _buildItem,
      )
    );
  }

  Widget _buildItem(BuildContext context, int index){
    final List<Question> questions = questionsData;
    if(index == questions.length){
      return ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text("Done")
      );
    }
    Question question = questions[index];
    bool correct = question.answer == answer[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "${question.question}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0
                ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "${answer[index]}",
              style: TextStyle(
                color: correct ? Colors.greenAccent : Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            correct
              ? Container()
              : Text.rich(
                TextSpan(children: [
                  TextSpan(text: "Answer"),
                  TextSpan(
                    text: "${question.answer}",
                    style: TextStyle(fontWeight: FontWeight.w500)
                  )
                ]),
              style: TextStyle(fontSize: 16.0),
              )
          ],
        ),
      ),
    );
  }
}
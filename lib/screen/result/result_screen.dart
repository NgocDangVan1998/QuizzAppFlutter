import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appquizz_flutter/Data/question.dart';
import 'package:appquizz_flutter/screen/check/check_answer_screen.dart';
class QuizResultScreen extends StatelessWidget{
  final Map<int,dynamic> answer;
  const QuizResultScreen({required this.answer});
  @override
  Widget build(BuildContext context) {
    int correct = 0;
    
    this.answer.forEach(
            (index, value) {
              if(questionsData[index].answer == value){ correct++; }
            }
    );
    final TextStyle titleStyle = TextStyle(
      color: Colors.black87,fontSize: 16.0, fontWeight: FontWeight.w500
    );

    final TextStyle trailingStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Result",style: TextStyle(fontFamily: 'RobotoMono',fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions",style: titleStyle,),
                  trailing: Text("${questionsData.length}",style: trailingStyle,),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Text("Score",style: titleStyle,),
                  trailing: Text("${correct / questionsData.length * 100}%"),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Text("Correct Answers",style: titleStyle,),
                  trailing: Text("${correct}/${questionsData.length}"),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  title: Text("Incorrect Answers",style: titleStyle,),
                  trailing: Text("${questionsData.length - correct}/${questionsData.length}"),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.home),
                      label: Text('Go to Home')
                  ),
                  ElevatedButton.icon(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CheckAnswerScreen(answer)));
                      },
                      icon: Icon(Icons.check_circle_outlined),
                      label: Text('Check Answers')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';

//void main(){
// runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}
class MyAppState extends State<MyApp>{
  var questionIndex = 0;

  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What \'s your favarite color??',
      'what \'s your favarite animal??',
    ];
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              Text(questions.elementAt(questionIndex),),
              RaisedButton(
                child: Text('Answer 1'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Answer 2'),
                onPressed: () => print('Answer 2 chosen'),
              ),
              RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  print('Answer 3 chosen');
                },
              ),
            ],
          )),
    );
  }
}

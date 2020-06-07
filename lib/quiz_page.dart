import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/Quiz_Question.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;
  QuizPage({Key key, @required this.questions}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizPageState();

}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz yourself!')
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: _buildQuiz(),
      ),
    );
  }

  _buildQuiz() {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: widget.questions.length,
      itemBuilder: (context, i) {
        return QuizQuestionWidget(question: widget.questions[i],);
      },
    );
  }

}

class QuizQuestionWidget extends StatefulWidget {
  final QuizQuestion question;
  QuizQuestionWidget({Key key, @required this.question}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizQuestionWidgetState();

}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(widget.question.questionText),
          ListView.builder(
            itemCount: 4,
            itemBuilder: (context, i) {
              return _buildQuestion(widget.question.questions[i], i);
            },
          )
        ],
      ),
    );
  }

  Widget _buildQuestion(String questionText, int index) {
    return  ListTile(
        title: Text(questionText),
        leading: Radio(
          value: index,
          groupValue: selectedIndex,
          onChanged: (int value) {
            setState(() {
              selectedIndex = value;
            });
          },
        )
    );
  }

}
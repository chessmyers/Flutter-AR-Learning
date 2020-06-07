import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/Module_Content.dart';
import 'model_view.dart';
import 'quiz_page.dart';

class ViewPage extends StatefulWidget {
  final ModuleContent moduleContent;

  const ViewPage({Key key, @required this.moduleContent}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Module content");
    print(widget.moduleContent.title);
    return Scaffold(
      appBar: AppBar(title: Text(widget.moduleContent.title)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  widget.moduleContent.infoContent,
                  softWrap: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildButton("View Quiz", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
                  }),
                  _buildButton("View AR Model", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UnityViewPage()));
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Function onPress) {
    return RaisedButton(
        onPressed: onPress,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Colors.blue, Colors.purple, Colors.black]),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Text(text, style: TextStyle(fontSize: 20)),
        ));
  }
}

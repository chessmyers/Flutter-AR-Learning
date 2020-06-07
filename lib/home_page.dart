import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/models/Module_Content.dart';
import 'view_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModuleContent> _moduleContent;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
//    _getListItems().then((content) {
//      print("Module content");
//      print(content);
//    });
  }

  Future<List<ModuleContent>> _getListItems() {
    final url = 'http://localhost:8080';
    return http.get(url).then((response) {
      List<ModuleContent> content = jsonDecode(response.body);
      return content;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeARn Home'),
      ),
      body: _buildList()
    );
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _moduleContent.length,
        itemBuilder: (context, i) {
          if (i > 0) {
            return new Column(
              children: <Widget>[
                Divider(),
                _buildItem(_moduleContent[i])
              ],
            );
          } else {
            return _buildItem(_moduleContent[i]);
          }
        }
    );
  }

  Widget _buildItem(ModuleContent m) {
    return ListTile(
      onTap: () {viewModule(m);},
      title: Text(
        m.moduleName,
        style: _biggerFont,
      ),
    );
  }

  viewModule(ModuleContent content) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewPage(moduleContent: content,)));
  }

}


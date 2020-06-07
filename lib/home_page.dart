import 'package:flutter/material.dart';
import 'package:my_app/models/Module_Content.dart';
import 'view_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _listItems = ['Cool geometry', 'Epic math', 'Nice history', 'Fun anatomy', 'Great programming', 'Awesome English'];
  final _biggerFont = const TextStyle(fontSize: 18.0);
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
        itemCount: _listItems.length,
        itemBuilder: (context, i) {
          if (i > 0) {
            return new Column(
              children: <Widget>[
                Divider(),
                _buildItem(_listItems[i])
              ],
            );
          } else {
            return _buildItem(_listItems[i]);
          }
        }
    );
  }

  Widget _buildItem(String s) {
    return ListTile(
      onTap: () {viewModule(s);},
      title: Text(
        s,
        style: _biggerFont,
      ),
    );
  }

  viewModule(String info) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewPage(moduleContent: new ModuleContent(info, "Description here", ["Q1", "Q2"]),)));
  }

}


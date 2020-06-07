import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
        title: const Text('Login to LeARn'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('images/logo.png',fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your email...'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Your email cannot be blank';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your password...'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Your password cannot be blank';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        // navigate to the next page
                        if (_formKey.currentState.validate()) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: 'LeARn Home')));
                        }
                      },
                      child: Text('Login'),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }

}
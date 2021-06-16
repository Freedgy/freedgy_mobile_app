import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({
    Key key,
    this.title,
    this.loggedIn,
  }) : super(key: key);

  final String title;
  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(loggedIn.toString()),
        ),
      ),
    );
  }
}

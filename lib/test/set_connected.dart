import 'package:flutter/material.dart';

class SetConnected extends StatelessWidget {
  const SetConnected({Key key, this.title, this.connected: false})
      : super(key: key);

  final String title;
  final bool connected;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Set Connected',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
      ),
    );
  }
}

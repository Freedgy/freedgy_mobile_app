import 'package:flutter/material.dart';

import 'package:mobile_app/config/size.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              "Welcome to Freedgy",
              style: TextStyle(
                fontSize: getScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

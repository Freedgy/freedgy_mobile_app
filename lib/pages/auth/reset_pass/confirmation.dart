import 'package:flutter/material.dart';

import 'package:mobile_app/config/size.dart';
import 'package:mobile_app/components/default_button.dart';
import 'package:mobile_app/pages/auth/sign_in/sign_in.dart';
import 'package:mobile_app/test/check_login.dart';
// import 'package:mobile/pages/home.dart';

class PasswordConfirmation extends StatelessWidget {
  static String routeName = "/email_confirmation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Confirmation"),
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
        Image.asset(
          "assets/images/confirmation.gif",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              "Check your email to change your password",
              style: TextStyle(
                fontSize: getScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: DefaultButton(
            text: "Back to login",
            press: () {
              Navigator.pushNamed(context, SignIn.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}

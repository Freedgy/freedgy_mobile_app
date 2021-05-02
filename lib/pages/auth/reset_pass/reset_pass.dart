import 'package:flutter/material.dart';

import 'package:mobile_app/config/size.dart';
import 'package:mobile_app/pages/auth/reset_pass/reset_pass_form.dart';

class ResetPassword extends StatelessWidget {
  static String routeName = "/reset_pass";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your email. A code will be sent to that email.\n",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                ResetPasswordForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SizedBox(height: getScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

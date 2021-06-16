import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/config/size.dart';
import 'package:mobile_app/config/constants.dart';
import 'package:mobile_app/components/form_error.dart';
import 'package:mobile_app/components/default_button.dart';
import 'package:mobile_app/components/custom_surfix_icon.dart';
import 'package:mobile_app/pages/auth/reset_pass/reset_pass.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  bool connected = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getScreenHeight(30)),
          Row(
            children: [
              Spacer(),
            ],
          ),
          FormError(errors: errors),
          ResetPasswordText(),
          SizedBox(height: getScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print("sign in");
                loginUserRequest(email, password);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your email");
        } else if (emailRegEx.hasMatch(value)) {
          removeError(error: "Please Enter Valid Email");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your email");
          return "";
        } else if (!emailRegEx.hasMatch(value)) {
          addError(error: "Please Enter Valid Email");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  loginUserRequest(email, password) async {
    var url = "http://10.0.2.2:8080/users/login";

    var request = http.Request('POST', Uri.parse(url));
    request.body =
        jsonEncode(<String, String>{'email': email, 'password': password});
    request.headers.addAll(
      <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      connected = true;
      // Navigator.pushNamed(context, .routeName);
    } else {
      print(response.reasonPhrase);
      addError(error: "Please Enter Valid Email");
    }
  }
}

class ResetPasswordText extends StatelessWidget {
  const ResetPasswordText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Forgot your password? ",
          style: TextStyle(fontSize: getScreenWidth(14)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, ResetPassword.routeName),
          child: Text(
            "Reset password",
            style: TextStyle(fontSize: getScreenWidth(14), color: PrimaryColor),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/config/constants.dart';
import 'package:mobile_app/config/size.dart';
import 'package:mobile_app/components/form_error.dart';
import 'package:mobile_app/components/default_button.dart';
import 'package:mobile_app/components/custom_surfix_icon.dart';
import 'package:mobile_app/pages/auth/email_confirmation.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String email;
  String password;
  String conformPassword;
  bool remember = false;
  bool isRegister = false;
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
          buildFirstNameFormField(),
          SizedBox(height: getScreenHeight(25)),
          buildLastNameFormField(),
          SizedBox(height: getScreenHeight(25)),
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(25)),
          buildPasswordFormField(),
          SizedBox(height: getScreenHeight(25)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print("info");
                print(firstName);
                print(email);
                print(password);
                print(conformPassword);
                registerUserRequest(firstName, lastName, email, password);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: "Passwords don't match");
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if ((password != value)) {
          addError(error: "Passwords don't match");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        } else if (value.length >= 4) {
          removeError(error: "Password is too short");
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 4) {
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

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your name");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your name");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  registerUserRequest(firstName, lastName, email, password) async {
    var url = "http://back.freedgy.com:8080/user/register";

    var request = http.Request('POST', Uri.parse(url));
    request.body = jsonEncode(<String, String>{
      'name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password
    });
    request.headers.addAll(
      <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      isRegister = true;
      print(response);
      print("done");
      Navigator.pushNamed(context, EmailConfirmation.routeName);
    } else {
      print(response.reasonPhrase);
    }
  }
}

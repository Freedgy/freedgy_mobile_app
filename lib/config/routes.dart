import 'package:flutter/widgets.dart';

import 'package:mobile_app/pages/auth/sign_in/sign_in.dart';
import 'package:mobile_app/pages/auth/sign_up/sign_up.dart';
import 'package:mobile_app/pages/auth/reset_pass/reset_pass.dart';
import 'package:mobile_app/pages/auth/email_confirmation.dart';
import 'package:mobile_app/pages/home.dart';

final Map<String, WidgetBuilder> routes = {
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  ResetPassword.routeName: (context) => ResetPassword(),
  EmailConfirmation.routeName: (context) => EmailConfirmation(),
  Home.routeName: (context) => Home()
};

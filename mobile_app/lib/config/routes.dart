import 'package:flutter/widgets.dart';

import 'package:mobile_app/pages/auth/sign_in/sign_in.dart';
import 'package:mobile_app/pages/auth/sign_up/sign_up.dart';

final Map<String, WidgetBuilder> routes = {
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
};

import 'package:flutter/material.dart';

import 'package:mobile_app/config/theme.dart';
import 'package:mobile_app/config/routes.dart';
import 'package:mobile_app/pages/auth/sign_in/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SignIn.routeName,
      routes: routes,
    );
  }
}

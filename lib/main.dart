import 'package:flutter/material.dart';

import 'package:mobile_app/config/theme.dart';
import 'package:mobile_app/config/routes.dart';
import 'package:mobile_app/pages/auth/sign_in/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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

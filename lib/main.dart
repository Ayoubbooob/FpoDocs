import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Welcome/welcome_screen.dart';

import 'constants.dart';
import 'formulaire/form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fpo Gestion Docs',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        "formulaire":(context) =>Formescreen(),
        },
    );
  }
}


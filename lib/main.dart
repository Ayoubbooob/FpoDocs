import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/landing_page.dart';
import 'package:provider/provider.dart';

import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';
import 'package:gestion_docs_fpo/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fpo Gestion Docs',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: LandingPage() /*LandingPage() WelcomeScreen(auth: Auth())*/,
        /*routes: {
          "formulaire":(context) =>Formescreen(),
          },*/
      ),
    );
  }
}

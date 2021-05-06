import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
import 'package:gestion_docs_fpo/Screens/Welcome/welcome_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({Key key, this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<AuthUser>(
        stream: auth.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            AuthUser user = snapshot.data;
            if (user == null) {
              return WelcomeScreen();
            }
            return HomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

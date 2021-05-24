import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
import 'package:gestion_docs_fpo/Screens/Welcome/welcome_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:gestion_docs_fpo/services/database.dart';
import 'package:provider/provider.dart';

import 'Screens/Home/home_page.dart';
import 'Screens/Home/home_page.dart';
import 'Screens/Home/home_page.dart';

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
            final displayName = user.displayName;
            final photoUrl = user.photoUrl;
            return  Provider<Database>(
                    create: (_) => FirestoreDatabase(uid:  user.uid),
                    child: HomePage(user : user)
                );
            // return ChangeNotifierProvider(
            //   create: (context) => FirestoreDatabase(uid:  user.uid),
            //   child: Scaffold(
            //       body: Builder(
            //         builder: (BuildContext newContext){
            //           return HomePage(context: newContext);
            //         },
            //       ),
            //   ),
            // );
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

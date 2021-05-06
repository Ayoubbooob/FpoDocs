import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/body_login.dart';

class LoginScreen extends StatelessWidget {
  //LoginScreen({@required this.auth});
  //final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: BodyLogin(/*auth: auth*/)),
    );
  }
}

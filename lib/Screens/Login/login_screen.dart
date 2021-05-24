import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/body_login.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_form_bloc_based.dart';

class LoginScreen extends StatelessWidget {
  //LoginScreen({@required this.auth});
  //final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(child: SignInFormBlocBased.create(context)/*BodyLogin(/*auth: auth*/)*/),
      body: BodyLogin(),
    );
  }
}

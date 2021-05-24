import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/background_login.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_form_bloc_based.dart';

class BodyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundLogin(
        child:
            SingleChildScrollView(child: SignInFormBlocBased.create(context)));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_button.dart';
import 'package:gestion_docs_fpo/Screens/Login/login_screen.dart';
import 'package:gestion_docs_fpo/Screens/Welcome/ComponentsWelcome/background_welcome.dart';
import 'package:gestion_docs_fpo/formulaire/form_screen.dart';
import '../../../constants.dart';

class BodyWelcome extends StatelessWidget {
  //final AuthBase auth;
  //const BodyWelcome({Key key, this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWelcome(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'BIENVENUE EN FPODOCS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black54),
          ),
          SizedBox(height: size.height * 0.02),
          SvgPicture.asset("assets/icons/docs.svg", height: size.height * 0.4),
          SizedBox(height: size.height * 0.05),
          RoundedButton(
              text: 'LOGIN',
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () => _onLoginButtonPressed(context)),
          RoundedButton(
            text: 'Information d\'accès',
            color: kPrimaryLightColor,
            textColor: Colors.black,
            onPressed: () => onInformationButtonPressed(context),
          ),
        ],
      ),
    ));
  }

  void _onLoginButtonPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => LoginScreen(/*auth: auth*/) /*LoginScreen()*/,
        ));
  }

  onInformationButtonPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
            fullscreenDialog: true, builder: (context) => Formescreen()));
  }
}

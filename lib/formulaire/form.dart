import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/background_login.dart';
import 'package:gestion_docs_fpo/constants.dart';

class Forme extends StatelessWidget {
  Forme({Key key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey();
  _submit() {
    //todo : send Data to service
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundLogin(
      child: Form(
        key: _formkey,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.09),

                  Text('Formulaire',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 20)),

                  SizedBox(height: size.height * 0.02),

                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 3,
                              spreadRadius: 0.1)
                        ]),
                    child: Icon(Icons.description_outlined,
                        size: 50, color: Colors.white),
                  ),

                  SizedBox(height: size.height * 0.04),

                  //SvgPicture.asset("assets/icons/login.svg",height: size.height * 0.25),

                  RoundedInputField(
                    //hintText: "Nom et Prénom",
                    label: "Nom et Prénom",
                    onChanged: (value) {},
                    icon: Icons.person,
                    validator: (text) {
                      if (text.trim().length == 0) {
                        return 'Veuillez saisir votre Nom et Prénom';
                      }
                      return null;
                    },
                    enabled: true,
                  ),
                  RoundedInputField(
                    //hintText: "Email",
                    label: "Email",
                    onChanged: (value) {},
                    icon: Icons.email,
                    //label: 'Email',
                    validator: (text) {
                      if (text.trim().length == 0) {
                        return 'Veuillez saisir votre Email';
                      }
                      return null;
                    },
                    enabled: true,
                  ),
                  RoundedInputField(
                    //hintText: "CIN",
                    label: "CIN",
                    onChanged: (value) {},
                    icon: Icons.code_sharp,
                    //label: 'CIN',
                    validator: (text) {
                      if (text.trim().length == 0) {
                        return 'Veuillez saisir votre CIN';
                      }
                      return null;
                    },
                    enabled: true,
                  ),

                  SizedBox(height: size.height * 0.02),
                  RoundedButton(
                      text: 'Envoyer',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onPressed: this._submit),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

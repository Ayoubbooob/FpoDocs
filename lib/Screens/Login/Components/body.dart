import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_docs_fpo/Common_Compenents/descreptive_table.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_password_field.dart';
import 'package:gestion_docs_fpo/Common_Compenents/text_field_container.dart';
import 'package:gestion_docs_fpo/Screens/Login/Components/background.dart';
import 'package:gestion_docs_fpo/Screens/home/home_page.dart';
import 'package:gestion_docs_fpo/constants.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '', _password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    /*final isok = _formkey.currentState.validate();
    print('ftom isok $isok');
    if (isok) {
      return print("email :$_email password : $_password");
    }*/
    print('email : ${_emailController.text}, password : ${_passwordController.text}');

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formkey,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold)),

            Container(
                height: 190,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 35),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),

                      //ICon perssone

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
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white),
                      )
                    ],
                  ),
                )),
            // SizedBox(height: size.height * 0.01),

            //SvgPicture.asset("assets/icons/login.svg",height: size.height * 0.25),
            // SizedBox(height: size.height * 0.01),
            Container(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Positioned(
                    child: RoundedInputField(
                      controller: _emailController,
                      hintText: "Entrez votre email",
                      onChanged: (value) {},
                      icon: Icons.email,
                      label: 'Email',
                      validator: (text) {
                        if (text.trim().length == 0) {
                          return 'le champ est vide';
                        }
                        return null;
                      },
                    ),
                  ),
                  RoundedPasswordField(onChanged: (value) {}, controller: _passwordController),
                  SizedBox(height: size.height * 0.02),
                  RoundedButton(
                      text: 'LOGIN',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onPressed: _submit,/*() => _onLoginHomePagePressed(context)*/
                        ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Vous n'avez pas du compte ? ",
                          style: TextStyle(color: kPrimaryColor)),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed("formulaire");
                          },
                          child: Text("cliquer ici",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  DescriptiveTable(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _onLoginHomePagePressed(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return HomePage();
            }
        )
    );
  }
}



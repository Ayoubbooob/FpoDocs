

import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/descreptive_table.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_password_field.dart';
import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
import 'package:gestion_docs_fpo/services/auth.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {

  final AuthBase auth;
  const SignInForm({Key key, this.auth}) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  get _email => _emailController.text;
  get _password => _passwordController.text;
  bool _submitted = false;

  void _submit() async {
    try {
      await widget.auth.signInWithEmailAndPassword(_email, _password);
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
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
                        errorText: ,
                        onChanged: (value) {
                          setState(() => _email = value);
                        },
                        icon: Icons.email,
                        label: 'Email',
                        validator: (val) => val.isEmpty
                            ? "Vous n'avez pas entrez votre email"
                            : null,
                      ),
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {
                        setState(() => _password = value);
                      },
                      // controller: _passwordController,
                      validator: (val) => val.isEmpty
                          ? "Vous n'avez pas entrez votre mot de passe"
                          : null,
                    ),
                    SizedBox(height: size.height * 0.02),
                    RoundedButton(
                      text: 'LOGIN',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onPressed: () => _onLoginButtonPressed(context)/*async {
                        if (_formkey.currentState.validate()) {
                          try {
                            //dynamic result = await widget.auth.signInWithEmailAndPassword(_email, _password);
                            if (result == null) {
                              setState(() =>
                              _error = 'Vos coordonnées sont invalides');
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                      }, () => _onLoginHomePagePressed(context)*/
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(_error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
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
    );
  }

  Future<void> _onLoginButtonPressed(BuildContext context){


    Navigator.push(context,
    MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context)=> HomePage(),
    ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_password_field.dart';
import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/validator.dart';
import 'package:gestion_docs_fpo/formulaire/form_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SignInFormStateful extends StatefulWidget
    with EmailAndPasswordValidators {
  //final AuthBase auth;
  //SignInForm({Key key, @required this.auth}) : super(key: key);
  @override
  _SignInFormStatefulState createState() => _SignInFormStatefulState();
}

class _SignInFormStatefulState extends State<SignInFormStateful> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithEmailAndPassword(_email, _password);
      _onLoginButtonPressed(context);
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildForm() {
    Size size = MediaQuery.of(context).size;
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;
    return Form(
      child: Column(
        children: <Widget>[
          Positioned(
            child: _buildEmailTextField(),
          ),
          Positioned(
            child: _buildPasswordTextField(),
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
              text: 'LOGIN',
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () => submitEnabled ? _submit : null),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Vous n'avez pas du compte ? ",
                  style: TextStyle(color: kPrimaryColor)),
              GestureDetector(
                  onTap: () => _cliqueIciButton(context),
                  child: Text("cliquer ici",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold)))
            ],
          ),
        ],
      ),
    );
  }

  RoundedInputField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return RoundedInputField(
      controller: _emailController,
      label: "Email",
      errorText: showErrorText ? widget.invalidEmailErrorText : null,
      icon: Icons.email,
      enabled: _isLoading == false,
      onChanged: (email) => _updateState(),
    );
  }

  RoundedPasswordField _buildPasswordTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return RoundedPasswordField(
      label: 'Mot De Passe',
      controller: _passwordController,
      errorText: showErrorText ? widget.invalidPasswordErrorText : null,
      enabled: _isLoading == false,
      onChanged: (password) => _updateState(),
    );
  }

  _onLoginButtonPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return HomePage();
            }));
  }

  _cliqueIciButton(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => Formescreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }

  void _updateState() {
    setState(() {});
  }
}

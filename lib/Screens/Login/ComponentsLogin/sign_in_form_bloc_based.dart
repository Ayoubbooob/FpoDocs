import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_docs_fpo/Common_Components/custom_raised_button.dart';
import 'package:gestion_docs_fpo/Common_Components/descreptive_table.dart';
import 'package:gestion_docs_fpo/Common_Components/form_submit_button.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_exception_alert_dialog.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Common_Components/rounded_password_field.dart';
import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_bloc.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_model.dart';
import 'package:gestion_docs_fpo/formulaire/form_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SignInFormBlocBased extends StatefulWidget {
  final SignInBloc bloc;
  SignInFormBlocBased({@required this.bloc});

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return Provider<SignInBloc>(
      create: (context) => SignInBloc(auth: auth),
      child: Consumer<SignInBloc>(
        builder: (context, bloc, _) => SignInFormBlocBased(bloc: bloc),
      ),
      dispose: (context, bloc) => bloc.dispose(),
    );
  }

  @override
  _SignInFormBlocBasedState createState() => _SignInFormBlocBasedState();
}

class _SignInFormBlocBasedState extends State<SignInFormBlocBased> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() async {
    try {
      await widget.bloc.submit();
      //Navigator.pop(context);
      _onLoginButtonPressed(context);
      /*Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return HomePage();
              }));*/
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: e,
      ).show(context);
    }
  }

  void _emailEditingComplete(SignInModel model) {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  Widget _buildForm(SignInModel model) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: <Widget>[
          _buildStatelessContent1(),
          SizedBox(
            height: size.height * 0.02,
          ),
          _buildEmailTextField(model),
          _buildPasswordTextField(model),
          SizedBox(height: size.height * 0.02),
          /*CustomRaisedButton(
              text: 'LOGIN',
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: model.canSubmit ? _submit : null),
          */
          FormSubmitButton(
            text: 'S\'authentifier',
            onPressed: model.canSubmit ? _submit : null,
            //onPressed: _submit,
          ),
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
          SizedBox(
            height: size.height * 0.02,
          ),
          DescriptiveTable(),
        ],
      ),
    );
  }

  RoundedInputField _buildEmailTextField(SignInModel model) {
    return RoundedInputField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      label: "Email",
      errorText: model.emailErrorText,
      icon: Icons.email,
      enabled: model.isLoading == false,
      textInputAction: TextInputAction.next,
      onChanged: widget.bloc.updateEmail,
      onEditingComplete: () => _emailEditingComplete(model),
    );
  }

  RoundedPasswordField _buildPasswordTextField(SignInModel model) {
    return RoundedPasswordField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      errorText: model.passwordErrorText,
      enabled: model.isLoading == false,
      textInputAction: TextInputAction.done,
      onChanged: widget.bloc.updatePassword,
      onEditingComplete: _submit,
    );
  }
  /*TextField _buildPasswordTextField(SignInModel model) {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: model.passwordErrorText,
        enabled: model.isLoading == false,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: widget.bloc.updatePassword,
      onEditingComplete: _submit,
    );
  }
  

  TextField _buildEmailTextField(SignInModel model) {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
        errorText: model.emailErrorText,
        enabled: model.isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: widget.bloc.updateEmail,
      onEditingComplete: () => _emailEditingComplete(model),
    );
  }*/

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

  Widget _buildStatelessContent1() {
    return Container(
        height: 180,
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
                          color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
                    ]),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SignInModel>(
        stream: widget.bloc.modelStream,
        initialData: SignInModel(),
        builder: (context, snapshot) {
          final SignInModel model = snapshot.data;
          return _buildForm(model);
        });
  }
}

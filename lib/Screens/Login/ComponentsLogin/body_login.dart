import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/background_login.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_form_bloc_based.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_form_change_notifier.dart';

class BodyLogin extends StatelessWidget {
  //BodyLogin({Key key, @required this.auth}) : super(key: key);
  //final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    //   return BackgroundLogin(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: SignInFormBlocBased.create(context),
    //       ),
    //     ),
    //   );
    // }
    return BackgroundLogin(
        child:
            SingleChildScrollView(child: SignInFormBlocBased.create(context)));
  }
}
//SignInForm(auth: auth),
//SizedBox(height: size.height * 0.02),
//DescriptiveTable(),
//final TextEditingController _emailController = TextEditingController();
//final TextEditingController _passwordController = TextEditingController();

//get _email => _emailController.text;
//get _password => _passwordController.text;
/*void _submit() async {
    {}
    try {
      await widget.auth.signInWithEmailAndPassword(_email, _password);
    } catch (e) {
      print(e.toString());
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return HomePage();
            }));
  }*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'input_text.dart';

class ConnecterServiceForm extends StatefulWidget {
  ConnecterServiceForm({Key key}) : super(key: key);

  @override
  _ConnecterServiceFormState createState() => _ConnecterServiceFormState();
}

class _ConnecterServiceFormState extends State<ConnecterServiceForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '', _password = '';
  _submit() {
    final isok = _formkey.currentState.validate();
    print('ftom isok $isok');
    if (isok) {
      return print("email :$_email password : $_password");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formkey,
      child: ListView(
        children: <Widget>[
          // Text(
          //   'Connecter Le Service',
          //   style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20, color: Colors.black54),
          // ),
          // SizedBox(height: size.height * 0.02),
          SvgPicture.asset("assets/icons/conecter_Service2.svg",
              height: size.height * 0.3),
          // SizedBox(height: size.height * 0.05),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Nom & prénom :"),
          ),
          InputText(
              label: 'Nom & prénom',
              champ: 'Entrez votre nom et prénom',
              onChanged: (text) {
                _email = text;
              },
              validator: (text) {
                if (text.trim().length == 0) {
                  return 'le champ est vide';
                }
                return null;
              }),
          ListTile(
            title: Text("Carte Nationale :"),
            leading: Icon(Icons.person_pin_rounded),
          ),
          InputText(
              label: 'CIN',
              champ: 'Entrez votre code cate national',
              onChanged: (text) {},
              validator: (text) {
                if (text.trim().length == 0) {
                  return 'le champ est vide';
                }
                return null;
              }),

          ListTile(
              title: Text("Message :"),
              leading: Icon(
                Icons.email_rounded,
              )),
          //  TextField(
          //    decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey[500]) ),
          //    ),
          //    maxLines:1,
          //  )
          InputText(
              label: 'message',
              champ: 'Entrez votre code cate national',
              onChanged: (text) {},
              line: 6,
              validator: (text) {
                if (text.trim().length == 0) {
                  return 'le champ est vide';
                }
                return null;
              }),
          SizedBox(height: size.height * 0.02),

          SizedBox(
            width: size.width * 0.01,
            // height: 100,
            child: RaisedButton(
                child: Text("Envoyer"),
                padding: EdgeInsets.symmetric(vertical: 23, horizontal: 2),
                color: Colors.blue[900],
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                onPressed: this._submit),
          ),
        ],
      ),
    );
  }
}

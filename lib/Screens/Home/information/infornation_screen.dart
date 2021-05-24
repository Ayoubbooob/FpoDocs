import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/services/auth.dart';

import '../../../constants.dart';
import 'information_body.dart';

class InformationScreen extends StatefulWidget {
  final AuthUser user;
  InformationScreen({Key key, this.user}) : super(key: key);
  static void show(AuthUser user, BuildContext context)  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationScreen(user : user),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar("Compte"),
      body: InformationBody(),
    );
  }

  AppBar buidAppBar(String title1) {
    return AppBar(
      title: Text(title1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 25)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
    );
  }
}

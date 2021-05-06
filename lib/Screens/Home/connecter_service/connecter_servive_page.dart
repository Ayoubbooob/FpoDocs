import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'connecter_service_form.dart';

class ConnecterServiceScreen extends StatefulWidget {
  ConnecterServiceScreen({Key key}) : super(key: key);

  @override
  _ConnecterServiceScreenState createState() => _ConnecterServiceScreenState();
}

class _ConnecterServiceScreenState extends State<ConnecterServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar("Connecter Service"),
      body: ConnecterServiceForm(),
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

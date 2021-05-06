import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'demander_doc_body.dart';

class DemanderDocScreen extends StatefulWidget {
  DemanderDocScreen({Key key}) : super(key: key);

  @override
  _DemanderDocScreenState createState() => _DemanderDocScreenState();
}

class _DemanderDocScreenState extends State<DemanderDocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar("Demander Documents"),
      body: DemanderDocBody(),
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

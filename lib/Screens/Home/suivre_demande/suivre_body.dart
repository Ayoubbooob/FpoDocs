import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/suivre_screen.dart';
import '../../../constants.dart';

class SuivreBody extends StatefulWidget {
  SuivreBody({Key key}) : super(key: key);

  @override
  _SuivreBodyState createState() => _SuivreBodyState();
}

class _SuivreBodyState extends State<SuivreBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar("Compte"),
      body: SuivreDocScreen(),
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

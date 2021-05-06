import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InformationBody extends StatefulWidget {
  InformationBody({Key key}) : super(key: key);

  @override
  _InformationBodyState createState() => _InformationBodyState();
}

class _InformationBodyState extends State<InformationBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: <Widget>[
      SvgPicture.asset("assets/icons/msinfo.svg", height: size.height * 0.3),
      ListTile(
        title: Text("Prénom"),
        subtitle: Text("Mohamed"),
      ),
      ListTile(
        title: Text("Nom"),
        subtitle: Text("Azzaoui"),
      ),
      ListTile(
        title: Text("N_Masser"),
        subtitle: Text("D130000000"),
      ),
      ListTile(
        title: Text("CIN"),
        subtitle: Text("PA00000"),
      ),
      ListTile(
        title: Text("Semestre"),
        subtitle: Text("S6"),
      ),
      ListTile(
        title: Text("Flliere"),
        subtitle: Text("SMI"),
      ),
    ]);
  }
}

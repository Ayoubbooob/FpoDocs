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
      SvgPicture.asset("assets/icons/my_infos_page.svg", height: size.height * 0.3),
      ListTile(
        title: Text("Prénom"),
        subtitle: Text("  Mohammed"),
      ),
      ListTile(
        title: Text("Nom"),
        subtitle: Text("  FPO"),
      ),
      ListTile(
        title: Text("Code Massar"),
        subtitle: Text("  D11111"),
      ),
      ListTile(
        title: Text("CIN"),
        subtitle: Text("  P11111"),
      ),
      ListTile(
        title: Text("Semestre"),
        subtitle: Text("  S6"),
      ),
      ListTile(
        title: Text("Filière"),
        subtitle: Text("  SMI"),
      ),
    ]);
  }
}

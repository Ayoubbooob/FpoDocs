

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Screens/home/body.dart';

import '../../constants.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}

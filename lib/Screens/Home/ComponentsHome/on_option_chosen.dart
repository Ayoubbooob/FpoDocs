import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Home/connecter_service/connecter_servive_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/demander_docs/demander_doc_screen.dart';
import 'package:gestion_docs_fpo/Screens/Home/information/infornation_screen.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/suivre_screen.dart';

class ChoseAnOption {
  //onTap: () {Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => DemanderDocScreen()));},
  static demanderDoc(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true, builder: (context) => DemanderDocScreen()));
  }

  static suivreDoc(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true, builder: (context) => SuivreDocScreen()));
  }

  static myInforations(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true, builder: (context) => InformationScreen()));
  }

  static connectService(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ConnecterServiceScreen()));
  }
}

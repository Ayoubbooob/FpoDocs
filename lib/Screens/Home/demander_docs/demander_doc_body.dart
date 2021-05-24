import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_exception_alert_dialog.dart';
import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';
import 'package:gestion_docs_fpo/services/database.dart';
import 'package:provider/provider.dart';

class DemanderDocBody extends StatefulWidget {
  @override
  _DemanderDocBodyState createState() => _DemanderDocBodyState();
}

class _DemanderDocBodyState extends State<DemanderDocBody> {
  final String doc_1 = "Baccalauréat";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: <Widget>[
          SvgPicture.asset("assets/icons/in_demander _doc_page.svg",
              height: size.height * 0.4),
          ExpansionTile(
              title: Text("Diplôme"),
              leading: Icon(Icons.domain_verification_rounded),
              children: [
                Divider(color: Colors.grey),
                ListTile(
                  title: Text(doc_1),
                  onTap: () => _createDemand(),
                    /*// final AlertDialog alert=,barrierDismissible: false
                    // showDialog(context: context, builder: (context) ){
                    final AlertDialog alert = buildAlertDialog("Baccalauréat");
                    /*showDialog(
                        builder: (context) => alert,
                        context: context,
                        barrierDismissible: false);*/
                    final response = await PlatformAlertDialog(
                      title: 'Confirmation',
                      content: 'Vous voulez vraimenet ce document?',
                      cancelActionText: 'Annuler',
                      defaultActionText: 'Confirmer',
                    ).show(context);
                    if(response == true){
                      _createDemand(context);
                    }
                  },*/
                ),
                ListTile(
                  title: Text("Deug"),
                  onTap: () {
                    final AlertDialog alert = buildAlertDialog("Deug");
                    showDialog(
                        builder: (context) => alert,
                        context: context,
                        barrierDismissible: false);
                  },
                ),
                ListTile(
                  title: Text("Licence"),
                  onTap: () {
                    final AlertDialog alert = buildAlertDialog("Licence");
                    showDialog(
                        builder: (context) => alert,
                        context: context,
                        barrierDismissible: false);
                  },
                ),
              ]),
          ExpansionTile(
              title: Text("Attestation"),
              leading: Icon(Icons.description_rounded),
              children: [
                ListTile(
                  title: Text("Réussite"),
                  subtitle: Text("Demande d'attestation de réussite"),
                  onTap: () {
                    final AlertDialog alert = buildAlertDialog("Réussite");
                    showDialog(
                        builder: (context) => alert,
                        context: context,
                        barrierDismissible: false);
                  },
                ),
                ListTile(
                  title: Text("Scolarité"),
                  subtitle: Text("Demende de certificat scolarité"),
                  onTap: () {
                    final AlertDialog alert = buildAlertDialog("Scolarité");
                    showDialog(
                        builder: (context) => alert,
                        context: context,
                        barrierDismissible: false);
                  },
                ),
              ]),
        ],
      ),
    );
  }

  AlertDialog buildAlertDialog(String titel) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Annuler", style: TextStyle(color: Colors.black38))),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:
                Text("Confirmer", style: TextStyle(color: Colors.green[800]))),
      ],
      title: Text(titel, style: TextStyle(color: Colors.blue[800])),
      content: Container(
        height: 90,
        child: Column(
          children: [
            Divider(color: Colors.black),
            Text("Vous voulez vraiment ce document",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 22)),
            // SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }

  Future<void> _createDemand() async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.createDemand(Demand(name: doc_1));
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation failed',
        exception: e,
      ).show(context);
    }
  }
}


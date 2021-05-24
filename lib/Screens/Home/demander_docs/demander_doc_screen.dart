import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_exception_alert_dialog.dart';
import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';
import 'package:gestion_docs_fpo/services/database.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class DemanderDocScreen extends StatefulWidget {
  const DemanderDocScreen({Key key, @required this.database, this.user})
      : super(key: key);
  final Database database;
  final User user;

  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DemanderDocScreen(database: database),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _DemanderDocScreenState createState() => _DemanderDocScreenState();
}

class _DemanderDocScreenState extends State<DemanderDocScreen> {
  String _docName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar('Demander des Documents'),
      body: _buildContentEtudiant(context),
    );
  }

  AppBar buidAppBar(String title1) {
    return AppBar(
      title: Text(title1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 22)),
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

  Widget _buildContentEtudiant(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ListView(children: <Widget>[
      SvgPicture.asset("assets/icons/in_demander_doc_page.svg",
          height: size.height * 0.4),
      ExpansionTile(
          title: Text("pour une seule fois "),
          leading: Icon(Icons.domain_verification_rounded),
          children: [
            Divider(color: Colors.grey),
            ListTile(
                title: Text('Baccalauréat'),
                onTap: () => {
                      _docName = 'Baccalauréat',
                      _demandConfirmation(context, _docName),
                    }),
            ListTile(
                title: Text('Deug : Diplôme'),
                onTap: () => {
                      _docName = 'Deug : Diplôme',
                      _demandConfirmation(context, _docName),
                    }),
            ListTile(
                title: Text('Licence : Diplôme'),
                onTap: () => {
                      _docName = 'Licence : Diplôme',
                      _demandConfirmation(context, _docName),
                    }),
            ListTile(
                title: Text('Relevé de note'),
                onTap: () => {
                      _docName = 'Relevé de note',
                      _demandConfirmation(context, _docName),
                    }),
          ]),
      ExpansionTile(
          title: Text("pour plusieurs fois "),
          leading: Icon(Icons.domain_verification_rounded),
          children: [
            Divider(color: Colors.grey),
            ListTile(
                title: Text('Attestation de réussite'),
                onTap: () => {
                      _docName = 'Attestation de réussite',
                      _demandConfirmation(context, _docName),
                    }),
            ListTile(
                title: Text('Attestation scolaire '),
                onTap: () => {
                      _docName = 'Attestation scolaire',
                      _demandConfirmation(context, _docName),
                    }),
            ListTile(
                title: Text('Pour un stage'),
                onTap: () => {
                      _docName = 'Pour un stage',
                      _demandConfirmation(context, _docName),
                    }),
          ])
    ]));
  }

  Future<void> _demandConfirmation(BuildContext context, String docName) async {
    final didRequestDemand = await PlatformAlertDialog(
      title: 'Confirmation',
      content: 'Vous voulez vraimenet votre $docName',
      cancelActionText: 'Annuler',
      defaultActionText: 'Confirmer',
    ).show(context);
    print('/////////// DidRequest == $didRequestDemand');
    if (didRequestDemand == true) {
      _submit(context, docName);
    }
  }

  Future<void> _submit(BuildContext context, String docName) async {
    print('Felicitation vous avez choisi $docName');
    final demands = await widget.database.demandsStream().first;
    final alldemands = demands.map((demand) => demand.name).toList();
    if (alldemands.contains(_docName)) {
      PlatformAlertDialog(
        title: 'demande existe',
        content: 'Vous avez déjà demandé $_docName',
        defaultActionText: 'OK',
      ).show(context);
    } else {
      try {
        final demand = Demand(name: docName);
        await widget.database.createDemand(demand);
        //Navigator.pop(context);
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(title: 'Operation échouée ', exception: e);
      }
    }
  }
}

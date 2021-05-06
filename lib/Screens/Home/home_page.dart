import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:provider/provider.dart';

import 'ComponentsHome/body_home.dart';

class HomePage extends StatelessWidget {
  final String title1 = "Accueil";
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Déconnection',
      content: 'Vous voulez vraimenet se déconnecter?',
      cancelActionText: 'Annuler',
      defaultActionText: 'Confirmer',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Acceuil'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Se déconnecter',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ), //buildAppBar(title1),
      drawer: buildDraWer(context),
      body: BodyHome(),
    );
  }

  /* AppBar buildAppBar(title1) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(title1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 25)),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        // SvgPicture.asset("assets/icons/back_arrow.svg"),
        onPressed: () {
          scaffoldkey.currentState.openDrawer();
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.home), color: Colors.black, onPressed: () {})
        // SizedBox(width: kDefaultPaddin / 2), onPressed: () {  },
      ],
    );
  }*/
  Drawer buildDraWer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Azzaoui"),
            accountEmail: Text("P66666@test.com"),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50)),
          ),
          ListTile(
              title: Text("FpoDocs"),
              leading: Icon(Icons.home),
              onTap: () {} //{Navigator.of(context).pushNamed("Homepage");},
              ),
          ListTile(
              title: Text("Demander documents"),
              leading: Icon(Icons.description_rounded),
              onTap:
                  () {} //onTap: () {Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => DemanderDocScreen()));},
              ),
          ListTile(
              title: Text("Connecter service"),
              leading: Icon(Icons.miscellaneous_services_rounded),
              onTap:
                  () {} //onTap: () => Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => ConnecterServicePage()))
              ),
          ListTile(
              title: Text("Suivre mes demandes"),
              leading: Icon(Icons.insert_drive_file_outlined),
              onTap:
                  () {} //onTap: () => Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => SuivreDocScreen())),
              ),
          ListTile(
              title: Text("Mes informations"),
              leading: Icon(Icons.perm_device_information),
              onTap: () {} // onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         fullscreenDialog: true,
              //         builder: (context) => InformationScreen())),
              ),
          ListTile(
            title: Text("help"),
            leading: Icon(Icons.help),
            onTap: () {},
          ),
          ListTile(
              title: Text("Déconnecté"),
              leading: Icon(Icons.exit_to_app_rounded),
              onTap: () {} //onTap: () => _confirmSignOut(context),
              ),
        ],
      ),
    );
  }
}

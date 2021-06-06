import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:gestion_docs_fpo/Screens/Home/account/account_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/connecter_service/connecter_servive_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/demander_docs/demander_doc_screen.dart';
import 'package:gestion_docs_fpo/Screens/Home/guide/guide_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/suivre_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:provider/provider.dart';

import 'information/infornation_screen.dart';

class HomePage extends StatelessWidget {
  final String title1 = "Accueil";
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final AuthUser user;

  HomePage({Key key, this.user}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
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

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Mohammed"),
            accountEmail: Text("P11111@fpo.com"),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50)),
          ),
          ListTile(
            title: Text("FpoDocs"),
            leading: Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text("Demander documents"),
            leading: Icon(Icons.description_rounded),
            onTap: () => DemanderDocScreen.show(context),
          ),
          ListTile(
            title: Text("Suivre mes demandes"),
            leading: Icon(Icons.insert_drive_file_outlined),
            onTap: () => SuivreDocScreen.show(context),
          ),
          ListTile(
              title: Text("Contacter Service"),
              leading: Icon(Icons.miscellaneous_services_rounded),
              onTap: () => _toContactServiceScreen(context)),
          ListTile(
              title: Text("Mon compte"),
              leading: Icon(Icons.perm_device_information),
              onTap: () => InformationScreen.show(user, context)),
          ListTile(
              title: Text("Guide"),
              leading: Icon(Icons.help),
              onTap: () => GuidePage.show(context)),
          ListTile(
            title: Text("Déconnecté"),
            leading: Icon(Icons.exit_to_app_rounded),
            onTap: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, String title1) {
    return AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 0,
      centerTitle: true,
      title: Text(title1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 25)),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          scaffoldkey.currentState.openDrawer();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          color: Colors.black,
          onPressed: () => _confirmSignOut(context),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                //Navigation(),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => DemanderDocScreen.show(context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/demander_docs_vf.svg',
                                height: 128,
                              ),
                              Text(
                                'Demander documents',
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => SuivreDocScreen.show(context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/suivre_doc_vf.svg',
                                height: 128,
                              ),
                              Text(
                                'Suivre mes demandes',
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => InformationScreen.show(user, context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/my_infos_vf.svg',
                                height: 128,
                              ),
                              Text(
                                'Mes informations',
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _toContactServiceScreen(context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/home_contact_service.svg',
                                height: 128,
                              ),
                              Text(
                                'Contacter Service',
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => GuidePage.show(context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/guide_vf.svg',
                                height: 128,
                              ),
                              Text(
                                "Guide",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(context, title1),
      drawer: _buildDrawer(context),
      body: _buildContent(context),
    );
  }

  void _toContactServiceScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ConnecterServiceScreen()));
  }
}

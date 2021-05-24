import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_exception_alert_dialog.dart';
import 'package:gestion_docs_fpo/Screens/Home/account/account_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/connecter_service/connecter_servive_page.dart';
import 'package:gestion_docs_fpo/Screens/Home/demander_docs/demander_doc_screen.dart';
import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/suivre_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:gestion_docs_fpo/services/database.dart';
import 'package:provider/provider.dart';

import 'ComponentsHome/body_home.dart';
import 'demander_docs/prof_demander_doc_screen.dart';
import 'information/infornation_screen.dart';

class HomePage extends StatelessWidget {
  final String title1 = "Accueil";
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final AuthUser user;

   HomePage({Key key, this.user}) : super(key: key);

   // HomePage({Key key, @required this.user}) : super(key: key);
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



  // Widget _buildContents(BuildContext context) {
  //   final database = Provider.of<Database>(context);
  //   return StreamBuilder<List<Demand>>(
  //     stream: database.demandsStream(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         final demands = snapshot.data;
  //         final children = demands.map((demand) => Text(demand.name)).toList();
  //         return ListView(children: children);
  //       }
  //       if (snapshot.hasError) {
  //         return Center(child: Text('Some error occurred'));
  //       }
  //       return Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }

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
              onTap: () =>
                Navigator.pop(context),
              //{Navigator.of(context).pushNamed("Homepage");},
          ),
          ListTile(
              title: Text("Demander documents"),
              leading: Icon(Icons.description_rounded),
              onTap: () => DemanderDocScreen.show(context),
                   //onTap: () {Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => DemanderDocScreen()));},
          ),
          ListTile(
            title: Text("Suivre mes demandes"),
            leading: Icon(Icons.insert_drive_file_outlined),
            onTap: () => SuivreDocScreen.show(context), //onTap: () => Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => SuivreDocScreen())),
          ),
          ListTile(
              title: Text("Connecter service"),
              leading: Icon(Icons.miscellaneous_services_rounded),
              onTap: () => _toContactServiceScreen(context) //onTap: () => Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder: (context) => ConnecterServicePage()))
          ),

          ListTile(
              title: Text("Mon compte"),
              leading: Icon(Icons.perm_device_information),
              onTap: () => InformationScreen.show(user, context)
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         fullscreenDialog: true,
            //         builder: (context) => AccountPage.show(context))),
          ),
          ListTile(
            title: Text("Guide"),
            leading: Icon(Icons.help),
            onTap: () {},
          ),
          ListTile(
              title: Text("Déconnecté"),
              leading: Icon(Icons.exit_to_app_rounded),
              onTap: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }
  // AppBar _buildAppBar(BuildContext context, String title1) {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     elevation: 0,
  //     centerTitle: true,
  //     title: Text(title1,
  //         style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black87,
  //             fontSize: 25)),
  //     leading: IconButton(
  //       icon: Icon(Icons.menu, color: Colors.black),
  //       // SvgPicture.asset("assets/icons/back_arrow.svg"),
  //       onPressed: () {
  //         scaffoldkey.currentState.openDrawer();
  //       },
  //     ),
  //     actions: <Widget>[
  //       IconButton(
  //           icon: Icon(Icons.home), color: Colors.black, onPressed: () {}),
  //       // SizedBox(width: kDefaultPaddin / 2), onPressed: () {  },
  //       // FlatButton(
  //       //   child: Text(
  //       //     'Logout',
  //       //     style: TextStyle(
  //       //       fontSize: 18.0,
  //       //       color: Colors.white,
  //       //     ),
  //       //   ),
  //       //   onPressed: () => _confirmSignOut(context),
  //       // ),
  //
  //     ],
  //   );
  // }
  AppBar _buildAppBar(BuildContext context, String title1) {
    return AppBar(
      //backgroundColor: Colors.white,
      backgroundColor: Colors.grey[100],
      elevation: 0,
      centerTitle: true,
      title: Text(title1,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87, fontSize: 25)),
      leading: IconButton(
        icon: Icon(Icons.menu, color:Colors.black),
        // SvgPicture.asset("assets/icons/back_arrow.svg"),
        onPressed: () {scaffoldkey.currentState.openDrawer();},
      ),
      actions: <Widget>[
        // IconButton(icon: Icon(Icons.home),color:Colors.black, onPressed: () {  })
        IconButton(
            icon: Icon(Icons.exit_to_app),color:Colors.black ,
            onPressed: () => _confirmSignOut(context),
        )
        // SizedBox(width: kDefaultPaddin / 2), onPressed: () {  },
      ],
    );
  }
  Widget _buildContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        // Container(
        //     height: size.height * .3,
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //           alignment: Alignment.topCenter,
        //           image: AssetImage('assets/images/top_header_homepage.png')),
        //     ),
        //   ),
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
                        onTap: ()  => DemanderDocScreen.show(context),
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
                                //style: cardTextStyle,
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
                                //style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8)),
                      //   elevation: 4,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       // SvgPicture.network(
                      //       //   'https://image.flaticon.com/icons/svg/1904/1904527.svg',
                      //       //   height: 128,
                      //       // ),
                      //       Text(
                      //         'Lire attentivement',
                      //         //style: cardTextStyle,
                      //       )
                      //     ],
                      //   ),
                      // ),
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
                                  height: 128,),
                              Text(
                                'Mes informations',
                                //style: cardTextStyle,
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
                                'Connecter service',
                                //style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => AccountPage.show(user, context),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              SvgPicture.asset(
                                'assets/icons/guide_vf.svg',
                                height: 128,),
                              Text(
                                "Guide",
                                //style: cardTextStyle,
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
    // return Scaffold(
    //    appBar: _buildAppBar(context, title1),
    //   // AppBar(
    //   //   title: Text('Accueil'),
    //   //   actions: <Widget>[
    //   //     // FlatButton(
    //   //     //   child: Text(
    //   //     //     'Logout',
    //   //     //     style: TextStyle(
    //   //     //       fontSize: 18.0,
    //   //     //       color: Colors.white,
    //   //     //     ),
    //   //     //   ),
    //   //     //   onPressed: () => _confirmSignOut(context),
    //   //     // ),
    //   //   ],
    //   // ),
    //   body: _buildContent(context),
    //   drawer: _buildDrawer(context),
    //   // floatingActionButton: FloatingActionButton(
    //   //   child: Icon(Icons.add),
    //   //   onPressed: () => DemanderDocScreen.show(context),
    //   // ),
    // );
    return Scaffold(
      key: scaffoldkey,
       backgroundColor: Colors.grey[100],
       appBar: _buildAppBar(context, title1),
        // AppBar(
      //   title: Text('Acceuil'),
      //   actions: <Widget>[
      //     TextButton(
      //       child: Text(
      //         'Se déconnecter',
      //         style: TextStyle(
      //           fontSize: 18.0,
      //           color: Colors.white,
      //         ),
      //       ),
      //       onPressed: () => _confirmSignOut(context),
      //     ),
      //   ],
      // ), //buildAppBar(title1),
      drawer: _buildDrawer(context),
       body: _buildContent(context),
    );
  }

  void _toContactServiceScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => ConnecterServiceScreen()
        )
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Acceuil'),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text(
  //             'Se déconnecter',
  //             style: TextStyle(
  //               fontSize: 18.0,
  //               color: Colors.white,
  //             ),
  //           ),
  //           //onPressed: () => _confirmSignOut(context),
  //         ),
  //       ],
  //     ), //buildAppBar(title1),
  //     //drawer: buildDraWer(context),
  //     body: _buildContent(context),
  //   );
  // }
  //



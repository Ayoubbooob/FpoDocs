


import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'demander_doc_body.dart';

class ProfDemanderDocScreen extends StatefulWidget {
  const ProfDemanderDocScreen({Key key, @required this.database, this.user}) : super(key: key);
  final Database database;
  final User user;
  // static Future<void> show(BuildContext context) async {
  //   final database = Provider.of<Database>(context, listen: false);
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => DemanderDocScreen(database: database),
  //       fullscreenDialog: true,
  //     ),
  //   );
  // }
  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfDemanderDocScreen(database: database),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _ProfDemanderDocScreenState createState() => _ProfDemanderDocScreenState();
}

class _ProfDemanderDocScreenState extends State<ProfDemanderDocScreen> {
  String _docName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar('Demander des Documents'),
      // AppBar(
      //   elevation: 2.0,
      //   title: Text('Demander des documents'),
      // ),
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

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       elevation: 2.0,
  //       title: Text('Demander des documents'),
  //     ),
  //     body: StreamBuilder<DocumentSnapshot>(
  //       stream: FirebaseFirestore.instance.collection('users').doc(widget.user.uid).snapshots(),
  //       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //         return _checkRole(context, snapshot.data);
  //       }
  //     ),
  //   );
  // }
  //
  // Widget _checkRole(BuildContext context , DocumentSnapshot snapshot) {
  //
  //   if (snapshot.get('Role') == 'Etudiant') {
  //     return _buildContentEtudiant(context);
  //   } else {
  //     return _buildContentPersonnel(context);
  //   }
  // }

  Widget _buildContentPersonnel(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ListView(children: <Widget>[
          SvgPicture.asset("assets/icons/in_demander _doc_page.svg",
              height: size.height * 0.4),
          ExpansionTile(
              title: Text("pour une seule fois "),
              leading: Icon(Icons.domain_verification_rounded),
              children: [
                Divider(color: Colors.grey),
                ListTile(
                    title: Text('Document X'),
                    onTap: () => {
                      _docName = 'Document X',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('Document X\''),
                    onTap: () => {
                      _docName = 'Document X\'',
                      _demandConfirmation(context, _docName),
                    }),
              ]),
          ExpansionTile(
              title: Text("pour plusieurs fois "),
              leading: Icon(Icons.domain_verification_rounded),
              children: [
                Divider(color: Colors.grey),
                ListTile(
                    title: Text('Attestation de salaire'),
                    onTap: () => {
                      _docName = 'Attestation de salaire',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('Attestation de travail'),
                    onTap: () => {
                      _docName = 'Attestation de travail',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('Certificat de promotion'),
                    onTap: () => {
                      _docName = 'Certificat de promotion',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('autorisation de quitter le territoire'),
                    onTap: () => {
                      _docName = 'autorisation de quitter le territoire',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('autorisation de congé'),
                    onTap: () => {
                      _docName = 'autorisation de congé',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('autorisation de déplacement'),
                    onTap: () => {
                      _docName = 'autorisation de déplacement',
                      _demandConfirmation(context, _docName),
                    }),
              ])
        ]));
  }
  Widget _buildContentEtudiant(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ListView(children: <Widget>[
          SvgPicture.asset("assets/icons/in_demander _doc_page.svg",
              height: size.height * 0.4),
          ExpansionTile(
              title: Text("pour une seule fois "),
              leading: Icon(Icons.domain_verification_rounded),
              children: [
                Divider(color: Colors.grey),
                ListTile(
                    title: Text('Document X'),
                    onTap: () => {
                      _docName = 'Document X',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('Document X\''),
                    onTap: () => {
                      _docName = 'Document X\'',
                      _demandConfirmation(context, _docName),
                    }),
              ]),
          ExpansionTile(
              title: Text("pour plusieurs fois "),
              leading: Icon(Icons.domain_verification_rounded),
              children: [
                Divider(color: Colors.grey),
                ListTile(
                    title: Text('Attestation de salaire'),
                    onTap: () => {
                      _docName = 'Attestation de salaire',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('Attestation de travail'),
                    onTap: () => {
                      _docName = 'Attestation de travail',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('Certificat de promotion'),
                    onTap: () => {
                      _docName = 'Certificat de promotion',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('autorisation de quitter le territoire'),
                    onTap: () => {
                      _docName = 'autorisation de quitter le territoire',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('autorisation de congé'),
                    onTap: () => {
                      _docName = 'autorisation de congé',
                      _demandConfirmation(context, _docName),
                    }),
                ListTile(
                    title: Text('autorisation de déplacement'),
                    onTap: () => {
                      _docName = 'autorisation de déplacement',
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
        content: 'Vous avez deja demande $_docName',
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

// // Future<void> _createDemand(BuildContext context) async {
// //   try {
// //     final database = Provider.of<Database>(context, listen: false);
// //     await database.createDemand(Demand(name: 'BAC'));
// //   } on PlatformException catch (e) {
// //     PlatformExceptionAlertDialog(
// //       title: 'Operation failed',
// //       exception: e,
// //     ).show(context);
// //   }
// // }
//
// Future<void> _createDemand(BuildContext context) async {
//     try {
//       final database = Provider.of<Database>(context, listen: false);
//       await database.createDemand(Demand(name: 'DEUG', forTest: 1122));
//     } on PlatformException catch (e) {
//       PlatformExceptionAlertDialog(
//         title: 'Operation failed',
//         exception: e,
//       ).show(context);
//     }
// }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Nouvelle Demande'),
//       actions: <Widget>[
//         FlatButton(
//           child: Text(
//             'Logout',
//             style: TextStyle(
//               fontSize: 18.0,
//               color: Colors.white,
//             ),
//           ),
//           onPressed: () => _confirmSignOut(context),
//         ),
//       ],
//     ),
//     body: _buildContents(context),
//     floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.add),
//       onPressed: () => AddJobPage.show(context),
//     ),
//   );
// }
//
// /*Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Jobs'),
//       actions: <Widget>[
//         FlatButton(
//           child: Text(
//             'Logout',
//             style: TextStyle(
//               fontSize: 18.0,
//               color: Colors.white,
//             ),
//           ),
//           //onPressed: () => _confirmSignOut(context),
//         ),
//       ],
//     ),
//     //body: _buildContents(context),
//     floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.add),
//       onPressed: () => _createDemand(context),
//     ),
//   );
// }*/
// AppBar buidAppBar(String title1) {
//   return AppBar(
//     title: Text(title1,
//         style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//             fontSize: 25)),
//     backgroundColor: Colors.white,
//     centerTitle: true,
//     elevation: 0,
//     leading: IconButton(
//       icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     ),
//     actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
//   );
// }
//
// _builtContent(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   return Container(
//     child: ListView(
//       children: <Widget>[
//         SvgPicture.asset("assets/icons/in_demander _doc_page.svg",
//             height: size.height * 0.4),
//         ExpansionTile(
//             title: Text("Diplôme"),
//             leading: Icon(Icons.domain_verification_rounded),
//             children: [
//               Divider(color: Colors.grey),
//               ListTile(
//                 title: Text('BAC'),
//                 onTap: () => _createDemand(context),
//                 /*// final AlertDialog alert=,barrierDismissible: false
//                   // showDialog(context: context, builder: (context) ){
//                   final AlertDialog alert = buildAlertDialog("Baccalauréat");
//                   /*showDialog(
//                       builder: (context) => alert,
//                       context: context,
//                       barrierDismissible: false);*/
//                   final response = await PlatformAlertDialog(
//                     title: 'Confirmation',
//                     content: 'Vous voulez vraimenet ce document?',
//                     cancelActionText: 'Annuler',
//                     defaultActionText: 'Confirmer',
//                   ).show(context);
//                   if(response == true){
//                     _createDemand(context);
//                   }
//                 },*/
//               ),
//               ListTile(
//                 title: Text("Deug"),
//                 onTap: () {
//                 //   final AlertDialog alert = buildAlertDialog("Deug");
//                 //   showDialog(
//                 //       builder: (context) => alert,
//                 //       context: context,
//                 //       barrierDismissible: false);
//                 },
//               ),
//               ListTile(
//                 title: Text("Licence"),
//                 onTap: () {
//                   // final AlertDialog alert = buildAlertDialog("Licence");
//                   // showDialog(
//                   //     builder: (context) => alert,
//                   //     context: context,
//                   //     barrierDismissible: false);
//                 },
//               ),
//             ]),
//         ExpansionTile(
//             title: Text("Attestation"),
//             leading: Icon(Icons.description_rounded),
//             children: [
//               ListTile(
//                 title: Text("Réussite"),
//                 subtitle: Text("Demande d'attestation de réussite"),
//                 onTap: () {
//                   // final AlertDialog alert = buildAlertDialog("Réussite");
//                   // showDialog(
//                   //     builder: (context) => alert,
//                   //     context: context,
//                   //     barrierDismissible: false);
//                 },
//               ),
//               ListTile(
//                 title: Text("Scolarité"),
//                 subtitle: Text("Demende de certificat scolarité"),
//                 onTap: () {
//                   // final AlertDialog alert = buildAlertDialog("Scolarité");
//                   // showDialog(
//                   //     builder: (context) => alert,
//                   //     context: context,
//                   //     barrierDismissible: false);
//                 },
//               ),
//             ]),
//       ],
//     ),
//   );
// }
//
//
// }
//
//

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
// import 'package:gestion_docs_fpo/Common_Components/platform_exception_alert_dialog.dart';
// import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';
// import 'package:gestion_docs_fpo/services/database.dart';
// import 'package:provider/provider.dart';
// import '../../../constants.dart';
// import 'demander_doc_body.dart';
//
// class ProfDemanderDocScreen extends StatefulWidget {
//   const ProfDemanderDocScreen({Key key, @required this.database}) : super(key: key);
//   final Database database;
//
//   static Future<void> show(BuildContext context) async {
//     final database = Provider.of<Database>(context, listen: false);
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProfDemanderDocScreen(database: database),
//         fullscreenDialog: true,
//       ),
//     );
//   }
//
//   @override
//   _ProfDemanderDocScreenState createState() => _ProfDemanderDocScreenState();
// }
//
// class _ProfDemanderDocScreenState extends State<ProfDemanderDocScreen> {
//   String _docName;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2.0,
//         title: Text('Demander des documents'),
//       ),
//       body: _buildContent(context),
//     );
//   }
//
//   Widget _buildContent(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//         child: ListView(children: <Widget>[
//           SvgPicture.asset("assets/icons/in_demander _doc_page.svg",
//               height: size.height * 0.4),
//           ExpansionTile(
//               title: Text("pour une seule fois "),
//               leading: Icon(Icons.domain_verification_rounded),
//               children: [
//                 Divider(color: Colors.grey),
//                 ListTile(
//                     title: Text('Document X'),
//                     onTap: () => {
//                       _docName = 'Document X',
//                       _demandConfirmation(context, _docName),
//                     }),
//                 ListTile(
//                     title: Text('Document X\''),
//                     onTap: () => {
//                       _docName = 'Document X\'',
//                       _demandConfirmation(context, _docName),
//                     }),
//               ]),
//           ExpansionTile(
//               title: Text("pour plusieurs fois "),
//               leading: Icon(Icons.domain_verification_rounded),
//               children: [
//                 Divider(color: Colors.grey),
//                 ListTile(
//                     title: Text('Attestation de salaire'),
//                     onTap: () => {
//                       _docName = 'Attestation de salaire',
//                       _demandConfirmation(context, _docName),
//                     }),
//                 ListTile(
//                     title: Text('Attestation de travail'),
//                     onTap: () => {
//                       _docName = 'Attestation de travail',
//                       _demandConfirmation(context, _docName),
//                     }),
//                 ListTile(
//                     title: Text('Certificat de promotion'),
//                     onTap: () => {
//                       _docName = 'Certificat de promotion',
//                       _demandConfirmation(context, _docName),
//                     }),
//                 ListTile(
//                     title: Text('autorisation de quitter le territoire'),
//                     onTap: () => {
//                       _docName = 'autorisation de quitter le territoire',
//                       _demandConfirmation(context, _docName),
//                     }),
//                 ListTile(
//                     title: Text('autorisation de congé'),
//                     onTap: () => {
//                       _docName = 'autorisation de congé',
//                       _demandConfirmation(context, _docName),
//                     }),
//                 ListTile(
//                     title: Text('autorisation de déplacement'),
//                     onTap: () => {
//                       _docName = 'autorisation de déplacement',
//                       _demandConfirmation(context, _docName),
//                     }),
//               ])
//         ]));
//   }
//
//   Future<void> _demandConfirmation(BuildContext context, String docName) async {
//     final didRequestDemand = await PlatformAlertDialog(
//       title: 'Confirmation',
//       content: 'Vous voulez vraimenet votre $docName',
//       cancelActionText: 'Annuler',
//       defaultActionText: 'Confirmer',
//     ).show(context);
//     print('/////////// DidRequest == $didRequestDemand');
//     if (didRequestDemand == true) {
//       _submit(context, docName);
//     }
//   }
//
//   Future<void> _submit(BuildContext context, String docName) async {
//     print('Felicitation vous avez choisi $docName');
//     final demands = await widget.database.demandsStream().first;
//     final alldemands = demands.map((demand) => demand.name).toList();
//     if (alldemands.contains(_docName)) {
//       PlatformAlertDialog(
//         title: 'demande existe',
//         content: 'Vous avez deja demande $_docName',
//         defaultActionText: 'OK',
//       ).show(context);
//     } else {
//       try {
//         final demand = Demand(name: docName);
//         await widget.database.createDemand(demand);
//         //Navigator.pop(context);
//       } on PlatformException catch (e) {
//         PlatformExceptionAlertDialog(title: 'Operation échouée ', exception: e);
//       }
//     }
//   }
// }
//
// // // Future<void> _createDemand(BuildContext context) async {
// // //   try {
// // //     final database = Provider.of<Database>(context, listen: false);
// // //     await database.createDemand(Demand(name: 'BAC'));
// // //   } on PlatformException catch (e) {
// // //     PlatformExceptionAlertDialog(
// // //       title: 'Operation failed',
// // //       exception: e,
// // //     ).show(context);
// // //   }
// // // }
// //
// // Future<void> _createDemand(BuildContext context) async {
// //     try {
// //       final database = Provider.of<Database>(context, listen: false);
// //       await database.createDemand(Demand(name: 'DEUG', forTest: 1122));
// //     } on PlatformException catch (e) {
// //       PlatformExceptionAlertDialog(
// //         title: 'Operation failed',
// //         exception: e,
// //       ).show(context);
// //     }
// // }
// // @override
// // Widget build(BuildContext context) {
// //   return Scaffold(
// //     appBar: AppBar(
// //       title: Text('Nouvelle Demande'),
// //       actions: <Widget>[
// //         FlatButton(
// //           child: Text(
// //             'Logout',
// //             style: TextStyle(
// //               fontSize: 18.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //           onPressed: () => _confirmSignOut(context),
// //         ),
// //       ],
// //     ),
// //     body: _buildContents(context),
// //     floatingActionButton: FloatingActionButton(
// //       child: Icon(Icons.add),
// //       onPressed: () => AddJobPage.show(context),
// //     ),
// //   );
// // }
// //
// // /*Widget build(BuildContext context) {
// //   return Scaffold(
// //     appBar: AppBar(
// //       title: Text('Jobs'),
// //       actions: <Widget>[
// //         FlatButton(
// //           child: Text(
// //             'Logout',
// //             style: TextStyle(
// //               fontSize: 18.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //           //onPressed: () => _confirmSignOut(context),
// //         ),
// //       ],
// //     ),
// //     //body: _buildContents(context),
// //     floatingActionButton: FloatingActionButton(
// //       child: Icon(Icons.add),
// //       onPressed: () => _createDemand(context),
// //     ),
// //   );
// // }*/
// // AppBar buidAppBar(String title1) {
// //   return AppBar(
// //     title: Text(title1,
// //         style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Colors.black87,
// //             fontSize: 25)),
// //     backgroundColor: Colors.white,
// //     centerTitle: true,
// //     elevation: 0,
// //     leading: IconButton(
// //       icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
// //       onPressed: () {
// //         Navigator.of(context).pop();
// //       },
// //     ),
// //     actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
// //   );
// // }
// //
// // _builtContent(BuildContext context) {
// //   Size size = MediaQuery.of(context).size;
// //   return Container(
// //     child: ListView(
// //       children: <Widget>[
// //         SvgPicture.asset("assets/icons/in_demander _doc_page.svg",
// //             height: size.height * 0.4),
// //         ExpansionTile(
// //             title: Text("Diplôme"),
// //             leading: Icon(Icons.domain_verification_rounded),
// //             children: [
// //               Divider(color: Colors.grey),
// //               ListTile(
// //                 title: Text('BAC'),
// //                 onTap: () => _createDemand(context),
// //                 /*// final AlertDialog alert=,barrierDismissible: false
// //                   // showDialog(context: context, builder: (context) ){
// //                   final AlertDialog alert = buildAlertDialog("Baccalauréat");
// //                   /*showDialog(
// //                       builder: (context) => alert,
// //                       context: context,
// //                       barrierDismissible: false);*/
// //                   final response = await PlatformAlertDialog(
// //                     title: 'Confirmation',
// //                     content: 'Vous voulez vraimenet ce document?',
// //                     cancelActionText: 'Annuler',
// //                     defaultActionText: 'Confirmer',
// //                   ).show(context);
// //                   if(response == true){
// //                     _createDemand(context);
// //                   }
// //                 },*/
// //               ),
// //               ListTile(
// //                 title: Text("Deug"),
// //                 onTap: () {
// //                 //   final AlertDialog alert = buildAlertDialog("Deug");
// //                 //   showDialog(
// //                 //       builder: (context) => alert,
// //                 //       context: context,
// //                 //       barrierDismissible: false);
// //                 },
// //               ),
// //               ListTile(
// //                 title: Text("Licence"),
// //                 onTap: () {
// //                   // final AlertDialog alert = buildAlertDialog("Licence");
// //                   // showDialog(
// //                   //     builder: (context) => alert,
// //                   //     context: context,
// //                   //     barrierDismissible: false);
// //                 },
// //               ),
// //             ]),
// //         ExpansionTile(
// //             title: Text("Attestation"),
// //             leading: Icon(Icons.description_rounded),
// //             children: [
// //               ListTile(
// //                 title: Text("Réussite"),
// //                 subtitle: Text("Demande d'attestation de réussite"),
// //                 onTap: () {
// //                   // final AlertDialog alert = buildAlertDialog("Réussite");
// //                   // showDialog(
// //                   //     builder: (context) => alert,
// //                   //     context: context,
// //                   //     barrierDismissible: false);
// //                 },
// //               ),
// //               ListTile(
// //                 title: Text("Scolarité"),
// //                 subtitle: Text("Demende de certificat scolarité"),
// //                 onTap: () {
// //                   // final AlertDialog alert = buildAlertDialog("Scolarité");
// //                   // showDialog(
// //                   //     builder: (context) => alert,
// //                   //     context: context,
// //                   //     barrierDismissible: false);
// //                 },
// //               ),
// //             ]),
// //       ],
// //     ),
// //   );
// // }
// //
// //
// // }
// //
// //

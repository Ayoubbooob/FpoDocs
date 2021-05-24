// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gestion_docs_fpo/Screens/Home/demander_docs/demander_doc_screen.dart';
// import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
// import 'package:gestion_docs_fpo/Screens/Home/home_page.dart';
// import 'package:gestion_docs_fpo/Screens/Welcome/welcome_screen.dart';
// import 'package:gestion_docs_fpo/services/auth.dart';
// import 'package:gestion_docs_fpo/services/database.dart';
// import 'package:provider/provider.dart';
//
// import 'Screens/Home/home_page.dart';
// import 'Screens/Home/home_page.dart';
// import 'Screens/Home/home_page.dart';
//
// class SwitchDemandPages extends StatefulWidget {
//   final Database database;
//
//   const SwitchDemandPages({Key key, @required this.database}) : super(key: key);
//
//   static Future<void> show(BuildContext context) async {
//     final database = Provider.of<Database>(context, listen: false);
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SwitchDemandPages(database: database),
//         fullscreenDialog: true,
//       ),
//     );
//   }
//   @override
//   _SwitchDemandPagesState createState() => _SwitchDemandPagesState();
// }
//
// class _SwitchDemandPagesState extends State<SwitchDemandPages> {
//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of<AuthBase>(context);
//     return StreamBuilder<User>(
//         stream: auth.authStateChanges,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             UserHelper.saveUser(snapshot.data);
//               return StreamBuilder<DocumentSnapshot>(
//                   stream: FirebaseFirestore.instance.collection("users").doc(snapshot.data.uid).snapshots() ,
//                   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
//                     if(snapshot.hasData && snapshot.data != null) {
//                       final userDoc = snapshot.data;
//                       final user = userDoc.data();
//                       if(user['role'] == 'Etudiant') {
//                         return DemanderDocScreen(database: database);
//                       }else{
//                         return HomePage();
//                       }
//                     }else{
//                       return Material(
//                         child: Center(child: CircularProgressIndicator(),),
//                       );
//                     }
//                   },
//                 }
//               );
//             final displayName = user.displayName;
//             final photoUrl = user.photoUrl;
//             return  Provider<Database>(
//                 create: (_) => FirestoreDatabase(uid:  user.uid),
//                 child: HomePage(user : user)
//             );
//             // return ChangeNotifierProvider(
//             //   create: (context) => FirestoreDatabase(uid:  user.uid),
//             //   child: Scaffold(
//             //       body: Builder(
//             //         builder: (BuildContext newContext){
//             //           return HomePage(context: newContext);
//             //         },
//             //       ),
//             //   ),
//             // );
//           } else {
//             return Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//         });
//   }
//
//   Widget _showEtudiantPage(BuildContext context) {
//       return await DemanderDocScreen.show(context);
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gestion_docs_fpo/Screens/home/navigation.dart';
// import 'package:gestion_docs_fpo/Screens/home/option_details.dart';
// import 'package:gestion_docs_fpo/Screens/home/options.dart';
// import './test3.dart';
// import './option_details.dart';
// import '../../constants.dart';
// import 'home_page.dart';
// import 'information/info1.dart';
//
// class BodyHome extends StatelessWidget {
//   CollectionReference notesref = FirebaseFirestore.instance.collection("users");
//   @override
//   Widget build(BuildContext context) {
//
//     // to get size
//     var size = MediaQuery.of(context).size;
//
//     // style
//     var cardTextStyle = TextStyle(
//         fontFamily: "Montserrat Regular",
//         fontSize: 14,
//         color: Color.fromRGBO(63, 63, 63, 1));
//
//     return Stack(
//       children: <Widget>[
//         // Container(
//         //     height: size.height * .3,
//         //     decoration: BoxDecoration(
//         //       image: DecorationImage(
//         //           alignment: Alignment.topCenter,
//         //           image: AssetImage('assets/images/top_header_homepage.png')),
//         //     ),
//         //   ),
//         SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               children: <Widget>[
//                 //Navigation(),
//                 Expanded(
//                   child: GridView.count(
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                     primary: false,
//                     crossAxisCount: 2,
//                     children: <Widget>[
//                       GestureDetector(
//                         onTap: () => DemanderDocScreen.show(context),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/icons/demander_docs.svg',
//                                 height: 128,
//                               ),
//                               Text(
//                                 'Demander documents',
//                                 //style: cardTextStyle,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => SuivreDocScreen.show(context),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/icons/suivre_doc.svg',
//                                 height: 128,
//                               ),
//                               Text(
//                                 'Suivre mes demandes',
//                                 //style: cardTextStyle,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       // Card(
//                       //   shape: RoundedRectangleBorder(
//                       //       borderRadius: BorderRadius.circular(8)),
//                       //   elevation: 4,
//                       //   child: Column(
//                       //     mainAxisAlignment: MainAxisAlignment.center,
//                       //     children: <Widget>[
//                       //       // SvgPicture.network(
//                       //       //   'https://image.flaticon.com/icons/svg/1904/1904527.svg',
//                       //       //   height: 128,
//                       //       // ),
//                       //       Text(
//                       //         'Lire attentivement',
//                       //         //style: cardTextStyle,
//                       //       )
//                       //     ],
//                       //   ),
//                       // ),
//                       GestureDetector(
//                         onTap: () => AccountPage.show(user, context),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               SvgPicture.network(
//                                 'https://image.flaticon.com/icons/svg/1904/1904437.svg',
//                                 height: 128,
//                               ),
//                               Text(
//                                 'Mes informations',
//                                 //style: cardTextStyle,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => _toContactServiceScreen(context),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               SvgPicture.asset(
//                                 'assets/icons/home_contact_service.svg',
//                                 height: 128,
//                               ),
//                               Text(
//                                 'Connecter service',
//                                 //style: cardTextStyle,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//
//
//
//
//     // return ListView(
//     // crossAxisAlignment: CrossAxisAlignment.start,
//     // children: <Widget>[
//     // Padding(
//     //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//     //   child: Text(
//     //     "Accueil",
//     //     style: Theme.of(context)
//     //         .textTheme
//     //         .headline5
//     //         .copyWith(fontWeight: FontWeight.bold),
//     //   ),
//     // ),
//     // Navigation(),
//     // Expanded(
//     //   child: Padding(
//     //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//     //     child: GridView.builder(
//     //         itemCount: options.length,
//     //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //           crossAxisCount: 2,
//     //           mainAxisSpacing: kDefaultPaddin,
//     //           crossAxisSpacing: kDefaultPaddin,
//     //           childAspectRatio: 0.75,
//     //         ),
//     //         itemBuilder: (context, index) => OptionDetails(
//     //           option: options[index],
//     //           onPressed: ()  => Navigator.push(
//     //               context,
//     //               MaterialPageRoute(
//     //                 builder: (context) => DetailsScreen(
//     //                   option: options[index],
//     //                 ),
//     //               )),
//     //         )),
//     //   ),
//     // ),
//     //
//     //Grid view
//     // Container(height: 600,
//     //   child:GridView(
//     //   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1),
//     //   children:<Widget>[
//     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
//     //     child:Text("Administration", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
//     //     onTap: (){
//     //       Navigator.of(context).pushNamed('document');
//     //     },),
//
//     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
//     //     child:Text("Etudiant", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
//     //     onTap: (){
//     //       Navigator.of(context).pushNamed('information');
//     //     }),
//
//     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
//     //     child:Text("maimouny", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
//     //     onTap: (){
//     //       Navigator.of(context).pushNamed('Suivre');
//     //     }),
//     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
//     //     child:Text("ayoub", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
//     //     onTap: (){
//     //       Navigator.of(context).pushNamed('cate');
//     //     }),
//
//
//
//
//     //   ]
//     // )
//     // ),
//     //   ],
//     // );
//   }
// }
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:gestion_docs_fpo/Screens/Home/ComponentsHome/on_option_chosen.dart';
// //
// // class BodyHome extends StatelessWidget {
// //   // Widget _buildContents(BuildContext context) {
// //   //   final database = Provider.of<Database>(context);
// //   //   return StreamBuilder<List<Job>>(
// //   //     stream: database.jobsStream(),
// //   //     builder: (context, snapshot) {
// //   //       if (snapshot.hasData) {
// //   //         final jobs = snapshot.data;
// //   //         final children = jobs.map((job) => Text(job.name)).toList();
// //   //         return ListView(children: children);
// //   //       }
// //   //       if (snapshot.hasError) {
// //   //         return Center(child: Text('Some error occurred'));
// //   //       }
// //   //       return Center(child: CircularProgressIndicator());
// //   //     },
// //   //   );
// //   // }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Jobs'),
// //         actions: <Widget>[
// //           FlatButton(
// //             child: Text(
// //               'Logout',
// //               style: TextStyle(
// //                 fontSize: 18.0,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             //onPressed: () => _confirmSignOut(context),
// //           ),
// //         ],
// //       ),
// //       body: _buildContents(context),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.add),
// //         onPressed: () => _createDemand(context),
// //       ),
// //     );
// //     // // to get size
// //     // //var size = MediaQuery.of(context).size;
// //     //
// //     // // style
// //     // var cardTextStyle = TextStyle(
// //     //     fontFamily: "Montserrat Regular",
// //     //     fontSize: 14,
// //     //     color: Color.fromRGBO(63, 63, 63, 1));
// //
// //     return Stack(
// //       children: <Widget>[
// //         /*Container(
// //           height: size.height * .3,
// //           decoration: BoxDecoration(
// //             image: DecorationImage(
// //                 alignment: Alignment.topCenter,
// //                 image: AssetImage('assets/images/top_header.png')),
// //           ),
// //         ),*/
// //         SafeArea(
// //           child: Padding(
// //             padding: EdgeInsets.all(16.0),
// //             child: Column(
// //               children: <Widget>[
// //                 //Navigation(),
// //                 Expanded(
// //                   child: GridView.count(
// //                     mainAxisSpacing: 10,
// //                     crossAxisSpacing: 10,
// //                     primary: false,
// //                     crossAxisCount: 2,
// //                     children: <Widget>[
// //                       GestureDetector(
// //                         onTap: () => ChoseAnOption.demanderDoc(context), //{
// //                         //   Navigator.of(context).pushNamed('information');
// //                         // },
// //                         child: Card(
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(8)),
// //                           elevation: 4,
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: <Widget>[
// //                               SvgPicture.asset(
// //                                 'assets/icons/demander_docs.svg',
// //                                 height: 128,
// //                               ),
// //                               Text(
// //                                 'Demander documents',
// //                                 //style: cardTextStyle,
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                       Card(
// //                         shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(8)),
// //                         elevation: 4,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: <Widget>[
// //                             SvgPicture.asset(
// //                               'assets/icons/suivre_doc.svg',
// //                               height: 128,
// //                             ),
// //                             Text(
// //                               'Suivre mes demandes',
// //                               //style: cardTextStyle,
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                       Card(
// //                         shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(8)),
// //                         elevation: 4,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: <Widget>[
// //                             // SvgPicture.network(
// //                             //   'https://image.flaticon.com/icons/svg/1904/1904527.svg',
// //                             //   height: 128,
// //                             // ),
// //                             Text(
// //                               'Lire attentivement',
// //                               //style: cardTextStyle,
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                       Card(
// //                         shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(8)),
// //                         elevation: 4,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: <Widget>[
// //                             // SvgPicture.network(
// //                             //   'https://image.flaticon.com/icons/svg/1904/1904437.svg',
// //                             //   height: 128,
// //                             // ),
// //                             Text(
// //                               'Mes informations',
// //                               //style: cardTextStyle,
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                       Card(
// //                         shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(8)),
// //                         elevation: 4,
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: <Widget>[
// //                             // SvgPicture.network(
// //                             //   'https://image.flaticon.com/icons/svg/1904/1904235.svg',
// //                             //   height: 128,
// //                             // ),
// //                             Text(
// //                               'Connecter service',
// //                               //style: cardTextStyle,
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //
// //     // return ListView(
// //     // crossAxisAlignment: CrossAxisAlignment.start,
// //     // children: <Widget>[
// //     // Padding(
// //     //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
// //     //   child: Text(
// //     //     "Accueil",
// //     //     style: Theme.of(context)
// //     //         .textTheme
// //     //         .headline5
// //     //         .copyWith(fontWeight: FontWeight.bold),
// //     //   ),
// //     // ),
// //     // Navigation(),
// //     // Expanded(
// //     //   child: Padding(
// //     //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
// //     //     child: GridView.builder(
// //     //         itemCount: options.length,
// //     //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //     //           crossAxisCount: 2,
// //     //           mainAxisSpacing: kDefaultPaddin,
// //     //           crossAxisSpacing: kDefaultPaddin,
// //     //           childAspectRatio: 0.75,
// //     //         ),
// //     //         itemBuilder: (context, index) => OptionDetails(
// //     //           option: options[index],
// //     //           onPressed: ()  => Navigator.push(
// //     //               context,
// //     //               MaterialPageRoute(
// //     //                 builder: (context) => DetailsScreen(
// //     //                   option: options[index],
// //     //                 ),
// //     //               )),
// //     //         )),
// //     //   ),
// //     // ),
// //     //
// //     //Grid view
// //     // Container(height: 600,
// //     //   child:GridView(
// //     //   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1),
// //     //   children:<Widget>[
// //     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
// //     //     child:Text("Administration", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
// //     //     onTap: (){
// //     //       Navigator.of(context).pushNamed('document');
// //     //     },),
// //
// //     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
// //     //     child:Text("Etudiant", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
// //     //     onTap: (){
// //     //       Navigator.of(context).pushNamed('information');
// //     //     }),
// //
// //     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
// //     //     child:Text("maimouny", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
// //     //     onTap: (){
// //     //       Navigator.of(context).pushNamed('Suivre');
// //     //     }),
// //     //     InkWell(child:GridTile(child: Image.asset("assets/images/info_client.png"),footer: Container(padding: EdgeInsets.only(top:13),height: 50,color: Colors.black.withOpacity(0.6) ,
// //     //     child:Text("ayoub", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,)),),
// //     //     onTap: (){
// //     //       Navigator.of(context).pushNamed('cate');
// //     //     }),
// //
// //     //   ]
// //     // )
// //     // ),
// //     //   ],
// //     // );
// //   }
// // }

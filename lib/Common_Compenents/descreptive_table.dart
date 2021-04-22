import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/constants.dart';
// import 'package:gestion_docs_fpo/fonts/my_flutter_app_icons.dart';

class DescriptiveTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Table(
        //defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FractionColumnWidth(0.4),
          1: FractionColumnWidth(0.3),
          2: FractionColumnWidth(0.3),
        },
        border: TableBorder.all(color: Colors.black, width: 0.5),
        children: [
          TableRow(children: [
            SizedBox(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8.0),
                Icon(Icons.person, color: kPrimaryColor),
                Text("Email",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 7.0),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Icon(Icons.lock, color: kPrimaryColor),
                Text("Mot de passe",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 7.0),
              ],
            ),
          ]),
          TableRow(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Row(children: [
                  Icon(
                    Icons.school,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 6),
                      child: Text("Etudiant",
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center))
                ]),
                SizedBox(height: 7.0),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Text("CIN",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 7.0),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Text("Code Massar",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 7.0),
              ],
            ),
          ]),
          TableRow(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Row(children: [
                  Icon(Icons.school),
                  //Tab(icon: Icon(MyFlutterApp.chalkboard_teacher)),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    child: Text("Personnel",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center),
                  )
                ]),
                SizedBox(height: 7.0),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Text("CIN",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 7.0),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 7.0),
                Text("Numéro de SOM",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 7.0),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}

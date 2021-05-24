

import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';

class UserDemandDesign extends StatelessWidget {
  UserDemandDesign ({ @required this.demand, @ required this.onTap});
  final Demand demand;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    //TODO : Optimize the design. This is just for test purpose
    return ListTile(
      title: Text(demand.name),
      trailing: Icon(IconData(0xe038, fontFamily: 'MaterialIcons'), color: Colors.black,),
      onTap: onTap,
    );
  }
}

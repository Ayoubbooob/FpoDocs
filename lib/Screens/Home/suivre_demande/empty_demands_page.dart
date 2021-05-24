

import 'package:flutter/material.dart';

class EmptyDemandsPage extends StatelessWidget {
  const EmptyDemandsPage({Key key,
    this.text = 'aucune demande passée',
    this.message = 'Demander des documents'}) : super(key: key);
  final String text, message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize:  26.0, color: Colors.black54)),
          Text(message, style: TextStyle(fontSize:  14.0, color: Colors.black54),)
        ],
      ),
    );
  }
}

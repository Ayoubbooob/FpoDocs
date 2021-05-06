

import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    this.text,
    this.color,
    this.textColor,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final Color color, textColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: onPressed,
            child: Text(text, style: TextStyle(color: textColor),)),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/constants.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    Key key,
    this.color,
    this.onPressed,
    this.child,
  }) : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          child: child,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          disabledColor: color,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

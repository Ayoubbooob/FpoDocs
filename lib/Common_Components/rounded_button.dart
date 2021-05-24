import 'package:flutter/material.dart';

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
      height: size.height * 0.09,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          color: color,
          // height: size.height * 0.09,
          child: TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              )),
        ),
      ),
    );
  }
}

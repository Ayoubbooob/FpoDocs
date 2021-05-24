import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String champ;
  final int line;
  final IconData icon;
  final void Function(String text) onChanged;
  final void Function(String text) validator;
  final void Function(String text) onsaved;
  const InputText(
      {Key key,
      this.keyboardType,
      this.obscureText = false,
      this.champ,
      this.icon,
      this.onChanged,
      this.validator,
      this.onsaved,
      this.line})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    // double df=size.height -(size.height *0.1);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5), //cursorcolor:kPrimaryColor,
       width: size.width * 0.09,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withAlpha(50),
      ),
      child: TextFormField(
        keyboardType: this.keyboardType,
        obscureText: this.obscureText,
        onChanged: this.onChanged,
        validator: this.validator,
        onSaved: this.onsaved,
        decoration: InputDecoration(
          hintText: this.champ,
          icon: Icon(icon, color: Colors.blue),
          // filled: true,
          fillColor: Colors.red,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[500])),
          // border: InputBorder.none,

          // suffix: Text("forgot password"),
          labelStyle:
              TextStyle(color: Colors.black45, fontWeight: FontWeight.w500),
        ),
        maxLines: line,
      ),
    );
  }
}

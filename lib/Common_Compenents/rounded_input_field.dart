import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Compenents/text_field_container.dart';
import 'package:gestion_docs_fpo/constants.dart';



class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(icon, color: kPrimaryColor),
            border: InputBorder.none,
          ),
        ));
  }
}
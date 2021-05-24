import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/text_field_container.dart';
import 'package:gestion_docs_fpo/constants.dart';



class RoundedInputFielde extends StatelessWidget {
  const RoundedInputFielde({
    Key key,
    this.hintText,
    this.icon ,
    this.onChanged,
    this.label,
    this.validator,
    this.onsaved
  }) : super(key: key);

  final String hintText;
  final String label;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final void Function(String text) validator;
  final void Function(String text) onsaved;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
          validator: this.validator,
          onSaved: this.onsaved,

          decoration: InputDecoration(
            hintText: hintText,
            labelText:label,
            icon: Icon(icon, color: kPrimaryColor),
            border: InputBorder.none,
          ),
        ));
  }
}
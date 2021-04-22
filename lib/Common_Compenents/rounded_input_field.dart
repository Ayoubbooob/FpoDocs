import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Compenents/text_field_container.dart';
import 'package:gestion_docs_fpo/constants.dart';



class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon ,
    this.onChanged,
    this.label,
    this.validator
  }) : super(key: key);

  final String hintText;
  final String label;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final void Function(String text) validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
          validator: this.validator,
          
          decoration: InputDecoration(
            hintText: hintText,
            labelText:label,
            icon: Icon(icon, color: kPrimaryColor),
            border: InputBorder.none,
          ),
        ));
  }
}
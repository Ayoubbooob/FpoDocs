import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/text_field_container.dart';
import 'package:gestion_docs_fpo/constants.dart';

class RoundedInputField extends StatefulWidget {
  const RoundedInputField({
    Key key,
    this.hintText,
    this.errorText,
    this.icon,
    this.onChanged,
    this.label,
    this.controller,
    this.enabled,
    this.validator,
    this.focusNode,
    this.onEditingComplete,
    this.textInputAction,
  }) : super(key: key);

  final String hintText;
  final String errorText;
  final String label;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool enabled;
  final FormFieldValidator<String> validator;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final TextInputAction textInputAction;

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: TextFieldContainer(
          child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        //validator: widget.validator,
        decoration: InputDecoration(
          //hintText: hintText,
          labelText: widget.label,
          errorText: widget.errorText,
          enabled: widget.enabled,
          icon: Icon(widget.icon, color: kPrimaryColor),
          border: InputBorder.none,
        ),
        autocorrect: false,
        textInputAction: TextInputAction.next,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
      )),
    );
  }
}

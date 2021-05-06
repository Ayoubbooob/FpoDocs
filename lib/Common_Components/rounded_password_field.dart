import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/text_field_container.dart';
import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.controller,
    this.enabled,
    this.errorText,
    this.label,
    this.focusNode,
    this.onEditingComplete,
    this.textInputAction,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool enabled;
  final String errorText;
  final String label;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final TextInputAction textInputAction;
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.11,
      child: TextFieldContainer(
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          obscureText: this.showText,
          decoration: InputDecoration(
              labelText: 'Mot de passe',
              errorText: widget.errorText,
              enabled: widget.enabled,
              prefixIcon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => showText = !this.showText);
                },
                icon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
              ),
              border: InputBorder.none),
          textInputAction: TextInputAction.done,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
        ),
      ),
    );
  }
}

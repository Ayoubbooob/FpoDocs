import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/custom_raised_button.dart';
import 'package:gestion_docs_fpo/constants.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          color: kPrimaryColor,
          onPressed: onPressed,
        );
}

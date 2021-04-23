

import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/home/options.dart';

import '../../constants.dart';

class OptionDetails extends StatelessWidget {
  final Options option;
  final Function onPressed;
  const OptionDetails({
    Key key,
    this.option,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: option.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${option.id}",
                child: Image.asset(option.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              option.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),

        ],
      ),
    );
  }
}

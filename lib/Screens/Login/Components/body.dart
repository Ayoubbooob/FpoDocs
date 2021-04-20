import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_docs_fpo/Common_Compenents/descreptive_table.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_password_field.dart';
import 'package:gestion_docs_fpo/Common_Compenents/text_field_container.dart';
import 'package:gestion_docs_fpo/Screens/Login/Components/background.dart';
import 'package:gestion_docs_fpo/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.02),
            Container(height: 100, width: 100,
             decoration: BoxDecoration(
                        color:kPrimaryColor,
                        
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color:Colors.black , blurRadius:3 , spreadRadius:0.1)]
              ),
            child:Icon(Icons.person, size: 50 , color:Colors.white) ,
            ),

            SizedBox(height: size.height * 0.04),
    

            //SvgPicture.asset("assets/icons/login.svg",height: size.height * 0.25),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(hintText: "Email", onChanged: (value) {}),
            RoundedPasswordField(onChanged: (value){}),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
                text: 'LOGIN',
                color: kPrimaryColor,
                textColor: Colors.white,
                onPressed: () {}
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Vous n'avez pas du compte ? ", style: TextStyle(color: kPrimaryColor)),
                GestureDetector(
                  onTap: () {},
                    child: Text("cliquer ici", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)))
              ],
            ),
            SizedBox(height: size.height * 0.02),
            DescriptiveTable(),

          ],
        ),
      ),
    );
  }
}



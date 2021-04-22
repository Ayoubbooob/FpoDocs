import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_docs_fpo/Common_Compenents/descreptive_table.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_button.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_input_field.dart';
import 'package:gestion_docs_fpo/Common_Compenents/rounded_password_field.dart';
import 'package:gestion_docs_fpo/Common_Compenents/text_field_container.dart';
import 'package:gestion_docs_fpo/Screens/Login/Components/background.dart';
import 'package:gestion_docs_fpo/constants.dart';


class Forme extends StatelessWidget {
  Forme({Key key}) : super(key: key);
  GlobalKey<FormState>_formkey = GlobalKey();
  String _email='', _password='';
    _submit(){
   final isok= _formkey.currentState.validate();
   print('ftom isok $isok');
   if(isok){
     return print("email :$_email password : $_password");
   }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Background(
      
      child: Form(
        key:_formkey,
    
        child: ListView(
          
          
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: SingleChildScrollView(child:Column(children:<Widget>[
            SizedBox(height: size.height * 0.09),
            Text('Formulair', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54, fontSize: 20)),

            SizedBox(height: size.height * 0.02),
            Container(height: 100, width: 100,
             decoration: BoxDecoration(
                        color:kPrimaryColor,
                        
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color:Colors.black , blurRadius:3 , spreadRadius:0.1)]
              ),
            child:Icon(Icons.description_outlined,size: 50 , color:Colors.white) ,
            ),

            SizedBox(height: size.height * 0.04),
    

            //SvgPicture.asset("assets/icons/login.svg",height: size.height * 0.25),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(hintText: "Entrez votre Nom et Prénom", onChanged: (value) {},icon: Icons.person,label: 'Nom & Prénom',
                              validator: (text){
                                  if(text.trim().length==0){return 'le champ est vide';}
                                  return null;
             },),
            RoundedInputField(hintText: "Entrez votre Email", onChanged: (value) {},icon: Icons.email,label: 'Email',
                               validator: (text){
                                  if(text.trim().length==0){return 'le champ est vide';}
                                  return null;
             },),
            RoundedInputField(hintText: "Carte Nationale D'identité ", onChanged: (value) {},icon: Icons.code_sharp,label: 'CIN',
                               validator: (text){
                                  if(text.trim().length==0){return 'le champ est vide';}
                                  return null;
             },),
            
            SizedBox(height: size.height * 0.02),
            RoundedButton(
                text: 'Envoyer',
                color: kPrimaryColor,
                textColor: Colors.white,
                onPressed: this._submit
            ),
            SizedBox(height: size.height * 0.02),
            
            ],
            ),)),

          ],
        ),
      ),
      
    );
  }
}
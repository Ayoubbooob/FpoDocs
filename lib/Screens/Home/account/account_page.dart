
import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Common_Components/avatar.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/suivre_screen.dart';
import 'package:gestion_docs_fpo/services/auth.dart';
import 'package:gestion_docs_fpo/services/database.dart';
import 'package:provider/provider.dart';
class AccountPage extends StatefulWidget {

  //final Database database;
 final AuthUser user;

 const AccountPage({Key key, this.user}) : super(key: key);

  static void show(AuthUser user, BuildContext context)  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountPage(user : user),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Déconnection',
      content: 'Vous voulez vraimenet se déconnecter?',
      cancelActionText: 'Annuler',
      defaultActionText: 'Confirmer',
    ).show(context);
    print('/////////// DidRequest == $didRequestSignOut');
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthUser>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Compte'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Se déconnecter',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),

        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: _buildUserInfo(),
        ),
      ),
    );
  }

 Widget _buildUserInfo() {
   return Column(
     children: <Widget>[
       Avatar(
         photoUrl: widget.user.photoUrl,
         radius: 50,
       ),
       SizedBox(height: 8),
       if (widget.user.displayName != null)
         Text(
           widget.user.displayName,
           style: TextStyle(color: Colors.white),
         ),
       SizedBox(height: 8),
     ],
   );
 }
 }

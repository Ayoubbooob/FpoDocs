import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/list_items_builder.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/user_demand_design.dart';
import 'package:gestion_docs_fpo/services/database.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SuivreDocScreen extends StatefulWidget {
  SuivreDocScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuivreDocScreen(database: database),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _SuivreDocScreenState createState() => _SuivreDocScreenState();
}

class _SuivreDocScreenState extends State<SuivreDocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar('Mes Demandes'),
      body: _buildContents(context),
    );
  }

  AppBar buidAppBar(String title1) {
    return AppBar(
      title: Text(title1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 22)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
    );
  }

  Widget _buildContents(BuildContext context) {
    return StreamBuilder<List<Demand>>(
      stream: widget.database.demandsStream(),
      builder: (context, snapshot) {
        return ListWidgetBuilder<Demand>(
            snapshot: snapshot,
            itemBuilder: (context, demand) => UserDemandDesign(
                  demand: demand,
                  onTap:
                      () {}, // TODO : if the demand is refused give the reason
                ));
      },
    );
  }
}

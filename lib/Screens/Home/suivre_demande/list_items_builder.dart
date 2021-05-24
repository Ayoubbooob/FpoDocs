

 //This class is to simplify the list of demands in Suivre demande Class



import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Home/suivre_demande/empty_demands_page.dart';
typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);


class ListWidgetBuilder<T> extends StatelessWidget {
  const ListWidgetBuilder({Key key, @required this.snapshot, @required this.itemBuilder,}) : super(key: key);

  final ItemWidgetBuilder<T> itemBuilder;
  final AsyncSnapshot<List<T>> snapshot;


  @override
  Widget build(BuildContext context) {
    if(snapshot.hasData){
      final List<T> items = snapshot.data;
      if(items.isNotEmpty){
        return _buildList(items);
      }else{
        return EmptyDemandsPage();
      }
    }else if(snapshot.hasError){
      return EmptyDemandsPage(
        text: 'Un problème est survenu',
        message: 'Impossible de charger vos demandes pour le moment ',
      );
    }
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
        itemCount: items.length + 2,
        separatorBuilder: (context, index) => Divider(height: 0.8),
        itemBuilder: (context, index) {
          if(index == 0 || index == items.length + 1){
            return Container();
            }
          return itemBuilder(context, items[index - 1] );
        },
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Home/models/demand.dart';
import 'package:gestion_docs_fpo/services/api_path.dart';
import 'package:gestion_docs_fpo/services/firestore_service.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

abstract class Database {
  Future<void> createDemand(Demand demand);

  Stream<List<Demand>> demandsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;
  String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
  Future<void> createDemand(Demand demand) async => await _service.setData(
        path: APIPath.demand(uid, documentIdFromCurrentDate()),
        data: demand.toMap(),
      );

  Stream<List<Demand>> demandsStream() => _service.collectionStream(
        path: APIPath.demands(uid),
        builder: (data) => Demand.fromMap(data),
      );
}

import 'package:meta/meta.dart';

class Demand {
  Demand({@required this.name});

  final String name;

  factory Demand.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int forTest = data['forTest'];
    return Demand(name: name);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}

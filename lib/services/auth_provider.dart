import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/services/auth.dart';

class AuthProvider extends InheritedWidget {
  final AuthBase auth;
  final Widget child;

  AuthProvider({@required this.auth, @required this.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AuthBase of(BuildContext context) {
    AuthProvider provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider.auth;
  }
}

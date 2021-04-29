
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthBase {
  Future<AuthUser> signInWithEmailAndPassword(String email, String password);
}

class Auth implements AuthBase{
  final _firebaseAuthInstant = FirebaseAuth.instance;

  AuthUser _userFromFirebase(User user){
    if(user == null){
      return null;
    }else{
      return AuthUser(uid: user.uid);
    }
  }
  @override
  Future<AuthUser> signInWithEmailAndPassword(String email, String password) async{
    final authResult = await _firebaseAuthInstant.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }
}
class AuthUser {
  AuthUser({@required this.uid});

 final String uid;
}
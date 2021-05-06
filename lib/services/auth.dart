import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthUser {
  AuthUser({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<AuthUser> currentUser();
  Stream<AuthUser> get authStateChanges;
  Future<AuthUser> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuthInstant = FirebaseAuth.instance;

  AuthUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    } else {
      return AuthUser(uid: user.uid);
    }
  }

  @override
  Stream<AuthUser> get authStateChanges {
    return _firebaseAuthInstant.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<AuthUser> currentUser() async {
    final user = _firebaseAuthInstant.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuthInstant.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthInstant.signOut();
  }
}

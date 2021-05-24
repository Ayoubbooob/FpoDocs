import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';

class AuthUser {
  AuthUser({
    @required this.uid,
  @required this.displayName,
  @required this.photoUrl,
    // @required this.firstName,
    // @required this.lastName,
    // @required this.semestre,
    // @required this.cin,
    // @required this.massar,
    // @required this.filliere,
  });

  final String uid, displayName, photoUrl;
  // final String firstName, lastName, semestre, cin, massar, filliere;
}

abstract class AuthBase {
  //Future<AuthUser> currentUser();
  AuthUser currentUser();

  Stream<AuthUser> get authStateChanges;

  Future<AuthUser> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuthInstant = FirebaseAuth.instance;

  AuthUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
      return AuthUser(uid: user.uid, displayName: user.displayName, photoUrl: user.photoURL);


  }

  @override
  Stream<AuthUser> get authStateChanges {
    return _firebaseAuthInstant.authStateChanges().map(_userFromFirebase);
  }

  @override
  AuthUser currentUser() {
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
class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = int.parse(packageInfo.buildNumber);

    Map<String, dynamic> userData = {
      "name": user.displayName,
      "email": user.email,
      "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
      "created_at": user.metadata.creationTime.millisecondsSinceEpoch,
      "role": "user",
      "build_number": buildNumber,
    };
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
        "build_number": buildNumber,
      });
    } else {
      await _db.collection("users").doc(user.uid).set(userData);
    }
    await _saveDevice(user);
  }

  static _saveDevice(User user) async {
    DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
    String deviceId;
    Map<String, dynamic> deviceData;
    if (Platform.isAndroid) {
      final deviceInfo = await devicePlugin.androidInfo;
      deviceId = deviceInfo.androidId;
      deviceData = {
        "os_version": deviceInfo.version.sdkInt.toString(),
        "platform": 'android',
        "model": deviceInfo.model,
        "device": deviceInfo.device,
      };
    }
    if (Platform.isIOS) {
      final deviceInfo = await devicePlugin.iosInfo;
      deviceId = deviceInfo.identifierForVendor;
      deviceData = {
        "os_version": deviceInfo.systemVersion,
        "device": deviceInfo.name,
        "model": deviceInfo.utsname.machine,
        "platform": 'ios',
      };
    }
    final nowMS = DateTime.now().toUtc().millisecondsSinceEpoch;
    final deviceRef = _db
        .collection("users")
        .doc(user.uid)
        .collection("devices")
        .doc(deviceId);
    if ((await deviceRef.get()).exists) {
      await deviceRef.update({
        "updated_at": nowMS,
        "uninstalled": false,
      });
    } else {
      await deviceRef.set({
        "updated_at": nowMS,
        "uninstalled": false,
        "id": deviceId,
        "created_at": nowMS,
        "device_info": deviceData,
      });
    }
  }
}

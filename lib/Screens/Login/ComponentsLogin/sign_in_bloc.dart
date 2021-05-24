import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestion_docs_fpo/Screens/Login/ComponentsLogin/sign_in_model.dart';
import 'package:gestion_docs_fpo/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});

  final AuthBase auth;

  final StreamController<SignInModel> _modelController =
      StreamController<SignInModel>();

  Stream<SignInModel> get modelStream => _modelController.stream;
  SignInModel _model = SignInModel();

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      await auth.signInWithEmailAndPassword(_model.email, _model.password);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    // update model
    _model = _model.copyWith(
      email: email,
      password: password,
      isLoading: isLoading,
      submitted: submitted,
    );
    // add updated model to _modelController
    _modelController.add(_model);
  }
}

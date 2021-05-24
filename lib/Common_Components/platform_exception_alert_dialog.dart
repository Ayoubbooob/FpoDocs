import 'package:flutter/services.dart';
import 'package:gestion_docs_fpo/Common_Components/platform_alert_dialog.dart';
import 'package:meta/meta.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
      title: title,
      content: _message(exception),
      defaultActionText: 'OK'
  );

  static String _message(PlatformException exception) {
    if (exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Error 7') {
        return 'Missing or insufficient permissions';
      }
    }
    return _errors[exception.code] ?? exception.message;
  }


  static Map<String, String> _errors = {
    'invalid-email': 'Email incorrecte',
    'wrong-password': 'Mot de passe incorrecte',
    'user-not-found' : 'Cet email ne correspond pas à aucun utilisateur',
  };
}

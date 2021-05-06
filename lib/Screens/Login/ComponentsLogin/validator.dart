abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Saisir Votre Email';
  final String invalidPasswordErrorText = 'Saisir Votre Mot de Passe';
  /*final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator cinValidator = NonEmptyStringValidator();
  final String invalidNameErrorText = 'Saisir Votre Nom';
  final String invalidCinErrorText = 'Saisir CIN';*/
}

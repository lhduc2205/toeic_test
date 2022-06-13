import 'package:formz/formz.dart';

enum PasswordValidatorError { match }

class ConfirmedPassword extends FormzInput<String, PasswordValidatorError> {
  const ConfirmedPassword.pure() : password = '', super.pure('');

  const ConfirmedPassword.dirty({
    this.password = '',
    String value = '',
  }) : super.dirty(value);

  final String? password;


  @override
  PasswordValidatorError? validator(String? value) {
    return password != value ? PasswordValidatorError.match : null;
  }
}

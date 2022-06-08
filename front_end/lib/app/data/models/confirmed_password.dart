import 'package:formz/formz.dart';

enum PasswordValidatorError { invalid }

class ConfirmedPassword extends FormzInput<String, PasswordValidatorError> {
  const ConfirmedPassword.pure() : super.pure('');

  const ConfirmedPassword.dirty({
    String password = '',
    String value = '',
  }) : super.dirty(value);

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidatorError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidatorError.invalid;
  }
}

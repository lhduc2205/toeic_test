import 'package:formz/formz.dart';

enum PasswordValidatorError { invalid }

class Password extends FormzInput<String, PasswordValidatorError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);


  @override
  PasswordValidatorError? validator(String? value) {
    return value!.length < 6
        ? PasswordValidatorError.invalid
        : null;
  }
}

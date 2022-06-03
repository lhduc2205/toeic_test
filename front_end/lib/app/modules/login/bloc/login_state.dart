import 'package:email_validator/email_validator.dart';

import 'auth/form_submission_status.dart';

// abstract class LoginState {}
//
// class LoginInitialState extends LoginState {
//   final String email;
//   final String password;
//   final FormSubmissionStatus formStatus;
//
//   LoginInitialState({
//     this.email = '',
//     this.password = '',
//     this.formStatus = const InitialFormStatus(),
//   });
// }
//
// class LoginInvalidState extends LoginState {}
//
// class LoginValidState extends LoginState {}
//
// class LoginErrorState extends LoginState {
//   final String errorMessage;
//
//   LoginErrorState(this.errorMessage);
// }
//
// class LoginLoadingState extends LoginState {}

class LoginState {
  final String email;
  bool get isInvalidEmail => EmailValidator.validate(email) == false;
  bool get isNullableEmail => email == '';

  final String password;
  bool get isValidPassword => password.length > 8;
  bool get isNullablePassword => password == '';

  final FormSubmissionStatus formStatus;

  LoginState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus:  formStatus ?? this.formStatus,
    );
  }
}

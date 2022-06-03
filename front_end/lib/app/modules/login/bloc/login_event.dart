abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  LoginTextChangedEvent(this.emailValue, this.passwordValue);
}

class LoginUsernameChanged extends LoginEvent {
  final String email;

  LoginUsernameChanged({required this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);
}
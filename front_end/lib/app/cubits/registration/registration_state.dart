part of registration_cubit;

enum RegistrationStatus { initial, submitting, success, error }

class RegistrationState extends Equatable {
  final String email;
  final String password;
  final String passwordCheck;
  final RegistrationStatus status;

  const RegistrationState({
    required this.email,
    required this.password,
    required this.status,
    required this.passwordCheck,
  });

  factory RegistrationState.initial() {
    return const RegistrationState(
      email: '',
      password: '',
      passwordCheck: '',
      status: RegistrationStatus.initial,
    );
  }

  @override
  List<Object?> get props => [email, password, passwordCheck, status];

  RegistrationState copyWith({
    String? email,
    String? password,
    String? passwordCheck,
    RegistrationStatus? status,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordCheck: passwordCheck ?? this.passwordCheck,
      status: status ?? this.status,
    );
  }
}

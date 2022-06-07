part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final User firebaseUser;

  const AuthSuccess(this.firebaseUser);

  @override
  List<Object?> get props => [];

}

class AuthFailure extends AuthState {}

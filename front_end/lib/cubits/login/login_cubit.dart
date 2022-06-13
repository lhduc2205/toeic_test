library login_bloc;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:front_end/data/repository/auth_repository.dart';
import 'package:front_end/network/auth_network.dart';

import '../../data/models/email.dart';
import '../../data/models/password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState());

  final AuthRepository _authRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  // Future<void> logInWithCredentials() async {
  //   if (!state.status.isValidated) return;
  //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
  //   try {
  //     bool isLoginSuccess = _authRepository.logInWithEmailAndPassword(
  //       email: state.email.value,
  //       password: state.password.value,
  //     );
  //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
  //   }
  //   on LogInWithEmailAndPasswordFailure catch (e) {
  //     emit(
  //       state.copyWith(
  //         errorMessage: e.message,
  //         status: FormzStatus.submissionFailure,
  //       ),
  //     );
  //   } catch (_) {
  //     emit(state.copyWith(status: FormzStatus.submissionFailure));
  //   }
  // }

  // Future<void> logInWithCredentials() async {
  //   if (!state.status.isValidated) return;
  //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
  //   try {
  //     final tokenResponse = await AuthNetwork.logIn(
  //       state.email.value,
  //       state.password.value,
  //     );
  //     Map<String, dynamic> tokenJson = tokenResponse.data;
  //
  //     final profileResponse = await AuthNetwork.getUser(tokenJson['token']);
  //     print(profileResponse.data);
  //
  //   } catch (_) {
  //     emit(state.copyWith(status: FormzStatus.submissionFailure));
  //   }
  // }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await Future.delayed(const Duration(seconds: 2));
    bool isLoginSuccess = _authRepository.logInWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
    );
    if (isLoginSuccess) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } else {
      emit(
        state.copyWith(
          errorMessage: 'Sai tai khoan hoac mat khau',
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

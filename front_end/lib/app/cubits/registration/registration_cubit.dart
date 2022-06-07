library registration_cubit;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthRepository _authRepository;

  RegistrationCubit(this._authRepository) : super(RegistrationState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: RegistrationStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: RegistrationStatus.initial,
      ),
    );
  }

  void passwordCheckChanged(String value) {
    emit(
      state.copyWith(
        passwordCheck: value,
        status: RegistrationStatus.initial,
      ),
    );
  }

  Future<void> registerFormSubmitted() async {
    if (state.status == RegistrationStatus.submitting) return;
    emit(state.copyWith(status: RegistrationStatus.submitting));
    // try {
    //   await _authRepository.signUp(
    //     email: state.email,
    //     password: state.password,
    //   );
    //   emit(state.copyWith(status: RegistrationStatus.success));
    // } catch (_) {}
    await Future.delayed(Duration(seconds: 5));
    emit(state.copyWith(status: RegistrationStatus.success));
  }
}

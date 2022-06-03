import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';

import '../../../repository/auth_repository.dart';
import 'auth/form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  // LoginBloc({required this.authRepo}) : super(LoginInitialState()) {
  //   on<LoginTextChangedEvent>((event, emit) async {
  //     if (event is LoginSubmitted) {
  //       if (event.emailValue == "") {
  //         emit(LoginErrorState(AppErrorString.EMAIL_REQUIRED));
  //       }
  //       else if (EmailValidator.validate(event.emailValue) == false) {
  //         emit(LoginErrorState(AppErrorString.INVALID_EMAIL));
  //       }
  //       else if (event.passwordValue == "") {
  //         emit(LoginErrorState(AppErrorString.PASSWORD_REQUIRED));
  //       }
  //       else if (event.passwordValue.length <= 8) {
  //         emit(LoginErrorState(AppErrorString.SHORT_PASSWORD));
  //       }
  //     }
  //
  //   });
  //
  //   on((event, emit) => {});
  // }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } on Exception catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(exception: e));
      }
    }
  }
}

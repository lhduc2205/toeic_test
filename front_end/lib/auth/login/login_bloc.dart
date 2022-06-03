import 'package:front_end/auth/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    }
    else if (event is LoginPasswordChanged) {
      yield state.copyWith(username: event.password);
    }
    else if (event is LoginSubmitted) {
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

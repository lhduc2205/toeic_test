import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:front_end/data/repository/user_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthInitial()) {

    on<AuthStarted>((event, emit) async {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final user = _userRepository.getUser();
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure());
      }
    });

    on<AuthLoggedIn>((event, emit) {
      emit(AuthSuccess(_userRepository.getUser()));
    });

    on<AuthLoggedOut>((event, emit) {
      emit(AuthFailure());
      _userRepository.signOut();
    });

  }
}

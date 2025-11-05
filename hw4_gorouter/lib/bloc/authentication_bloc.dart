import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnauthenticated()) {
    on<AuthenticationLoggedIn>((event, emit) {
      emit(AuthenticationAuthenticated());
    });
    on<AuthenticationLoggedOut>((event, emit) {
      emit(AuthenticationUnauthenticated());
    });
  }
}

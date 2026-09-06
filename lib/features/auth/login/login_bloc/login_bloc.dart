import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';

import 'package:ecommerce_app/features/auth/login/login_bloc/login_events.dart';
import 'package:ecommerce_app/features/auth/login/login_bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  AuthRepository authRep;
  StorageServices storageServices;
  LoginBloc(this.authRep, this.storageServices) : super(LoginInitialState()) {
    on<OnEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, emailError: ''));
    });
    on<OnPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, passwordError: ''));
    });
    on<OnPasswordVisibilityChanged>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
    on<OnLoginButtonPressed>((event, emit) async {
      String emailErr = '';
      String passErr = '';
      bool hasError = false;

      emit(state.copyWith(status: LoginStatus.loading));

      if (state.email.isEmpty ||
          !state.email.contains('@') ||
          !state.email.contains('.')) {
        emailErr = 'enter s valid email';
        hasError = true;
      }
      if (state.password.isEmpty || state.password.length < 6) {
        passErr = 'enter a valid password';
        hasError = true;
      }
      if (hasError) {
        emit(
          state.copyWith(
            emailError: emailErr,
            passwordError: passErr,
            status: LoginStatus.error,
          ),
        );
        return;
      }
      try {
        await authRep.login(state.email, state.password);
        await storageServices.setIsUserLoggedIn(true);
        emit(state.copyWith(status: LoginStatus.success));
      } catch (e) {
        emit(state.copyWith(status: LoginStatus.error, error: e.toString()));
      }
    });
    on<ClearLoginData>((event, emit) {
      emit(LoginStates());
    });
  }
}

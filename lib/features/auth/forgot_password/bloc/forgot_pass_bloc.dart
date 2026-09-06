import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/forgot_password/bloc/forgot_pass_events.dart';
import 'package:ecommerce_app/features/auth/forgot_password/bloc/forgot_pass_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvents, ForgotPassStates> {
  AuthRepository authRepository;
  ForgotPassBloc(this.authRepository) : super(ForgotPassStates()) {
    on<OnEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, emailError: ""));
    });
    on<OnPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, passwordError: ""));
    });
    on<OnConfirmPasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: event.confirmPassword,
          confirmPasswordError: "",
        ),
      );
    });
    on<OnEmailSubmit>((event, emit) async {
      if (state.email.isEmpty) {
        emit(state.copyWith(emailError: "Email is required"));
        return;
      }
      emit(state.copyWith(status: ForgotPassStatus.loading));
      try {
        await authRepository.sendOTP(state.email, "resetPassword");
        emit(state.copyWith(status: ForgotPassStatus.successOne));
      } catch (e) {
        emit(
          state.copyWith(status: ForgotPassStatus.error, error: e.toString()),
        );
      }
    });
    on<OnNewPassSubmit>((event, emit) async {
      emit(state.copyWith(status: ForgotPassStatus.initial));
      String passwordErr = '';
      String confirmPasswordErr = '';
      bool hasError = false;
      if (state.password.isEmpty) {
        passwordErr = "Password is required";
        hasError = true;
      }
      if (state.confirmPassword.isEmpty) {
        confirmPasswordErr = "Password is required";
        hasError = true;
      }
      if (state.password != state.confirmPassword) {
        confirmPasswordErr = "Password doesn't match";
        hasError = true;
      }
      if (hasError) {
        emit(
          state.copyWith(
            passwordError: passwordErr,
            confirmPasswordError: confirmPasswordErr,
            status: ForgotPassStatus.error,
          ),
        );
        return;
      }
      emit(state.copyWith(status: ForgotPassStatus.loading));
      try {
        await authRepository.resetPassword(state.password, event.otp);
        emit(state.copyWith(status: ForgotPassStatus.successTwo));
      } catch (e) {
        emit(
          state.copyWith(status: ForgotPassStatus.error, error: e.toString()),
        );
      }
    });
  }
}

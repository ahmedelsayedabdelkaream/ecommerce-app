import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/otp/bloc/otp_events.dart';
import 'package:ecommerce_app/features/auth/otp/bloc/otp_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc extends Bloc<OtpEvents, OtpStates> {
  final AuthRepository authRepository;
  OtpBloc(this.authRepository) : super(OtpStates(status: OtpStatus.initial)) {
    on<OnOtpResend>((event, emit) async {
      await authRepository.sendOTP(event.email, event.purpose);
    });
    on<OnOtpSubmit>((event, emit) async {
      emit(state.copyWith(status: OtpStatus.loading));
      try {
        if (event.purpose == "verifyEmail") {
          await authRepository.vreifyEmailOTP(event.email, event.otp);
          emit(state.copyWith(status: OtpStatus.success));
        } else {
          final data = await authRepository.vreifyResetPasswordOTP(
            event.email,
            event.otp,
          );
          emit(state.copyWith(status: OtpStatus.success, otp: data.otp));
        }
      } catch (e) {
        emit(state.copyWith(status: OtpStatus.error, error: e.toString()));
      }
    });
  }
}

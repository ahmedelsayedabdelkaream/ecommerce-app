import 'package:ecommerce_app/core/functions.dart';
import 'package:ecommerce_app/data/models/user_model.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_events.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  AuthRepository authRepo;
  SignUpBloc(this.authRepo) : super(const SignUpInitialState()) {
    // Name Change Event
    on<OnNameChange>((event, emit) {
      emit(
        state.copyWith(
          status: SignUpStatus.initial,
          name: event.name,
          nameError: "",
        ),
      );
    });
    // Email Change Event
    on<OnEmailChange>((event, emit) {
      emit(state.copyWith(email: event.email, emailError: ""));
    });
    // Password Change Event
    on<OnPasswordChange>((event, emit) {
      emit(state.copyWith(password: event.password, passwordError: ""));
    });
    // Confirm Password Change
    on<OnConfirmPasswordChange>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: event.confirmPassword,
          confirmPasswordError: "",
        ),
      );
    });
    on<OnPasswordVisibilityChanged>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
    on<OnPasswordVisibilityChanged2>((event, emit) {
      emit(state.copyWith(isPasswordVisible2: !state.isPasswordVisible2));
    });
    // Accept Terms Event
    on<ToggleTermsEvent>((event, emit) {
      emit(
        state.copyWith(toggelError: "", isTermAccepted: !state.isTermAccepted),
      );
    });
    on<OnImageChange>((event, emit) async {
      try {
        final imageUrl = await customImagePickerFromGallery();
        emit(state.copyWith(image: imageUrl));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });
    // Country Code change event
    on<OnChangeCountryCode>((event, emit) {
      emit(
        state.copyWith(
          status: SignUpStatus.initial,
          countryCode: event.countryCode,
        ),
      );
    });
    // Phone Number Change
    on<OnPhoneNumberChange>((event, emit) {
      emit(
        state.copyWith(
          status: SignUpStatus.initial,
          phoneNumber: event.phoneNumber,
          phoneNumberError: "",
        ),
      );
    });
    on<OnGenderChange>((event, emit) {
      emit(
        state.copyWith(
          status: SignUpStatus.initial,
          gender: event.gender,
          genderError: '',
        ),
      );
    });
    // PRESSING SIGN UP BUTTON EVENT
    on<SignUpButtonPressedEvent>((event, emit) async {
      bool hasError = false;
      String? nameErr;
      String? emailErr;
      String? passwordErr;
      String? confirmPasswordErr;
      String? toggleErr;

      // clear errors
      emit(
        state.copyWith(
          error: "",
          emailError: "",
          passwordError: "",
          confirmPasswordError: "",
          toggelError: "",
        ),
      );
      // validation

      if (state.email.isEmpty ||
          !state.email.contains("@") ||
          !state.email.contains(".")) {
        emailErr = "enter a vaild email";
        hasError = true;
      }
      if (state.password.isEmpty || state.password.length < 6) {
        passwordErr = "enter a valid password";
        hasError = true;
      }
      if (state.password != state.confirmPassword) {
        confirmPasswordErr = "Password doesn't match";
        hasError = true;
      }
      if (!state.isTermAccepted) {
        toggleErr = "Please accept terms and condition";
        hasError = true;
      }
      if (hasError) {
        emit(
          state.copyWith(
            error: "",
            nameError: nameErr,
            emailError: emailErr,
            passwordError: passwordErr,
            confirmPasswordError: confirmPasswordErr,
            toggelError: toggleErr,
          ),
        );
        return;
      }
      // loading
      emit(state.copyWith(status: SignUpStatus.loading));
      // sign up api calling
      try {
        AuthModel user = await authRepo.register(state.email, state.password);

        emit(
          state.copyWith(status: SignUpStatus.successOne, userId: user.userId),
        );
      } catch (e) {
        emit(
          state.copyWith(
            error: e.toString(),
            isTermAccepted: state.isTermAccepted,
            status: SignUpStatus.error,
          ),
        );
      }
    });
    on<CompleteProfileButtonPressedEvent>((event, emit) async {
      bool hasError = false;
      String? nameErr;
      String? phoneNumberErr;
      String? genderErr;

      // clear errors
      emit(
        state.copyWith(
          error: "",
          emailError: "",
          passwordError: "",
          confirmPasswordError: "",
          toggelError: "",
        ),
      );
      // validation
      if (state.name.isEmpty) {
        nameErr = "Please enter your name";
        hasError = true;
      }
      if (state.phoneNumber!.isEmpty) {
        phoneNumberErr = "Please enter your Phone Number";
        hasError = true;
      }
      if (state.gender.isEmpty) {
        genderErr = "Please enter your gender";
        hasError = true;
      }

      if (hasError) {
        emit(
          state.copyWith(
            error: "",
            nameError: nameErr,
            phoneNumberError: phoneNumberErr,
            genderError: genderErr,
          ),
        );
        return;
      }
      // loading
      emit(state.copyWith(status: SignUpStatus.loading));
      // sign up api calling
      try {
        UserModel userModel = UserModel(
          id: state.userId,
          name: state.name,
          phone: state.phoneNumber,
          gender: state.gender,
          image: state.image,
        );
        await authRepo.completeProfile(userModel);

        emit(state.copyWith(status: SignUpStatus.successTwo));
      } catch (e) {
        emit(
          state.copyWith(
            error: e.toString(),
            isTermAccepted: state.isTermAccepted,
            status: SignUpStatus.error,
          ),
        );
      }
    });
    on<ClearSignUpData>((event, emit) {
      emit(SignUpStates());
    });
  }
}

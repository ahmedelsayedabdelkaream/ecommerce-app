import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_events.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_states.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:ecommerce_app/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/shared/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          padding: EdgeInsets.all(3),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            shadowColor: WidgetStatePropertyAll(Colors.black),
            elevation: WidgetStatePropertyAll(1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                "Complete Your Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Don't worry, only you can see your personal\n data. No one else will be able to see it.",
                textAlign: TextAlign.center,
                style: TextTheme.of(context).headlineMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<SignUpBloc, SignUpStates>(
                builder: (context, state) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      context.read<SignUpBloc>().add(OnImageChange());
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: AppColors.imageColor,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.file(
                              state.image == null ? File("") : state.image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person_2, size: 40);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              // FORM FIELDS
              BlocBuilder<SignUpBloc, SignUpStates>(
                builder: (context, state) {
                  return CustomTextform(
                    isPassword: false,
                    label: "Name",
                    hint: "Ex. John Doe",
                    errorMesg: state.nameError!,
                    controller: nameController,
                    onChange: (value) {
                      context.read<SignUpBloc>().add(OnNameChange(name: value));
                    },
                  );
                },
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 5),
              BlocBuilder<SignUpBloc, SignUpStates>(
                builder: (context, state) {
                  return CustomTextform(
                    isPassword: false,
                    keyboardType: TextInputType.phone,
                    hint: "Phone Number",
                    label: "Phone Number",
                    errorMesg: state.phoneNumberError!,
                    controller: phoneNumberController,
                    onChange: (value) {
                      context.read<SignUpBloc>().add(
                        OnPhoneNumberChange(phoneNumber: value),
                      );
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: GestureDetector(
                        onTap: () {
                          // 1. SHOW A COUNTRY PICKER HERE
                          showCountryPicker(
                            context: context,
                            // showPhoneCode: true,
                            onSelect: (value) {
                              context.read<SignUpBloc>().add(
                                OnChangeCountryCode(
                                  countryCode: "+${value.phoneCode}",
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(state.countryCode!), // "+1"
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // GENDER
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: const Text("Gender"),
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<SignUpBloc, SignUpStates>(
                    builder: (context, state) {
                      return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          errorText: state.genderError,
                          filled: true,
                          fillColor: AppColors.imageColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        hint: const Text("Select Gender"),
                        items: ["Male", "Female"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // Update your Bloc state here
                          context.read<SignUpBloc>().add(
                            OnGenderChange(gender: value!),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // FINISH BUTTON
              BlocBuilder<SignUpBloc, SignUpStates>(
                builder: (context, state) {
                  return CustomButton(
                    child: state.status == SignUpStatus.loading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Finish",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                    onPressed: () {
                      // Handle completion
                      context.read<SignUpBloc>().add(
                        CompleteProfileButtonPressedEvent(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

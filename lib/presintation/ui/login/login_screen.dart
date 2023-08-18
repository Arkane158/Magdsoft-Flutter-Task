// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_avatar.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_container.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_divider.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_elevated_button.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_form_field.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/dialoge_utils.dart';
import 'package:magdsoftfluttertask/presintation/ui/login/di.dart';
import 'package:magdsoftfluttertask/presintation/ui/login/login_view_model.dart';
import 'package:magdsoftfluttertask/presintation/ui/otp/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String screenName = "login-screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  LoginViewModel viewModel = LoginViewModel(injectLoginUseCase());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0x7f0062bd),
                    BlendMode.srcATop,
                  ),
                  child: Image.asset('assets/images/login.png'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomContainer(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .68,
                    radiusTopLeft: 60,
                    radiusTopRight: 60,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: Material(
                      elevation: 15,
                      borderRadius: BorderRadius.circular(40),
                      child: CustomContainer(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                        radiusTopLeft: 40,
                        radiusBottomLeft: 40,
                        radiusBottomRight: 40,
                        radiusTopRight: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Welcome',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .15,
                                    ),
                                    child: CustomContainer(
                                      width: 140,
                                      height: 3,
                                      containerColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  CustomFormField(
                                    hintText: 'Enter Your Full Name',
                                    controller: fullNameController,
                                    type: TextInputType.name,
                                    validator: (text) {
                                      if (text == null ||
                                          text.trim().isEmpty ||
                                          fullNameController.text != text) {
                                        return 'Please Enter your full name';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomFormField(
                                    hintText: 'Enter Your Phone Number',
                                    controller: phoneNumberController,
                                    type: TextInputType.phone,
                                    validator: (text) {
                                      if (text == null ||
                                          text.trim().isEmpty ||
                                          phoneNumberController.text != text) {
                                        return 'Please enter your phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                  BlocConsumer<LoginViewModel, LoginState>(
                                      listener: (context, state) {
                                    if (state is LoadingState) {
                                      DialogeUtils.showProgressDialog(
                                          context, 'Loading...');
                                    } else if (state is ErrorState) {
                                      DialogeUtils.showMessage(
                                          context, state.errorMessage,
                                          posActionTitle: 'Ok');
                                    } else if (state is SuccessState) {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        OtpScreen.screenName,
                                        (route) => false,
                                        arguments: phoneNumberController
                                            .text, // Pass the phone number as an argument.
                                      );
                                    } else if (state is HideLoadingState) {
                                      Navigator.pop(context);
                                    }
                                  }, builder: (context, state) {
                                    return CustomElevatedButton(
                                      onPressed: () {
                                        login();
                                      },
                                      label: 'Login',
                                      radius: 50,
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * .05,
                      vertical: MediaQuery.of(context).size.height * .25),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        CustomDivider(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CustomDivider(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .1,
                      horizontal: MediaQuery.of(context).size.width * .2),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAvatar(imagePath: 'assets/images/google.png'),
                        CustomAvatar(imagePath: 'assets/images/facebook.png'),
                        CustomAvatar(imagePath: 'assets/images/apple.png'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    FocusScope.of(context).unfocus();

    viewModel.login(fullNameController.text, phoneNumberController.text);
  }
}

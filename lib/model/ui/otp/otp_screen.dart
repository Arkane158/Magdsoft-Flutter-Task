import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/ui/custom_widgets/custom_colorgrid_container.dart';
import 'package:magdsoftfluttertask/model/ui/custom_widgets/custom_elevated_button.dart';
import 'package:magdsoftfluttertask/model/ui/custom_widgets/dialoge_utils.dart';
import 'package:magdsoftfluttertask/model/ui/home/home_screen.dart';
import 'package:magdsoftfluttertask/model/ui/otp/otp_viewmodel.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static const String screenName = 'OtpScreen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNumber = '';
  String text = "";
  OTPViewModel viewModel = OTPViewModel();

  void onKeyboardTap(String value) {
    setState(() {
      if (text.length < 4) {
        text = text + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    phoneNumber = ModalRoute.of(context)?.settings.arguments as String;

    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        
        body: BlocListener<OTPViewModel, OTPState>(
          listener: (context, state) {
            if (state is LoadingState) {
              DialogeUtils.showProgressDialog(context, 'Loading ...');
            } else if (state is ErrorState) {
              DialogeUtils.showMessage(context, state.errorMessage);
            } else if (state is SuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.screenName,
                (route) => false,
              );
            }
          },
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: CustomColorGridContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.04),
                            child: Text(
                              "Verify Phone",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < 4; i++)
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      i < text.length ? text[i] : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontSize: 28,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              'Resend Code',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.09,
                    ),
                    child: CustomElevatedButton(
                        onPressed: verify, label: 'Verify'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: NumericKeyboard(
                      
                      onKeyboardTap: onKeyboardTap,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      rightButtonFn: () {
                        if (text.isEmpty) return;
                        setState(() {
                          text = text.substring(0, text.length - 1);
                        });
                      },
                      
                      rightButtonLongPressFn: () {
                        if (text.isEmpty) return;
                        setState(() {
                          text = '';
                        });
                      },
                      rightIcon: const Icon(
                        Icons.backspace_outlined,
                        color: Colors.blueGrey,
                      ),
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verify() async {
    viewModel.sumbit(otp: text, phone: phoneNumber);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/api/api_manager.dart';

import '../home/home_screen.dart';

class OTPViewModel extends Cubit<OTPState> {
  OTPViewModel() : super(LoadingState());
  void sumbit({required String otp, required String phone}) async {
    try {
      var response = await ApliManager.otpRequest(otp, phone);
      if (response.status !=200 ) {
        emit(ErrorState(response.message.toString()));
      } else if (response.status == 200) {
          emit(SuccessState(HomeScreen.screenName));
        
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class OTPState {}

class LoadingState extends OTPState {}

class ErrorState extends OTPState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends OTPState {
  String screenName;
  SuccessState(this.screenName);
}

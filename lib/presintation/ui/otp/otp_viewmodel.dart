import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/domain/usecases/otp_usecase.dart';

import '../home/home_screen.dart';

class OTPViewModel extends Cubit<OTPState> {
  OtpUsecase usecase;
  OTPViewModel(this.usecase) : super(LoadingState());
  void sumbit({required String otp, required String phone}) async {
    try {
      var response = await usecase.invoke(otp, phone);
      if (response?.status != 200) {
        emit(ErrorState('${response?.message}'));
      } else if (response?.status == 200) {
        emit(SuccessState(HomeScreen.screenName));
      }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
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

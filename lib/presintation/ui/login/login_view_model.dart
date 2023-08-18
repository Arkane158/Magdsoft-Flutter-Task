import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/domain/usecases/login_usecase.dart';
import 'package:magdsoftfluttertask/presintation/ui/otp/otp_screen.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginUsecase usecase;
  LoginViewModel(this.usecase) : super(LoadingState());

  void login(String name, String phone) async {
    try {
      emit(LoadingState());
      var response = await usecase.invoke(name, phone);

      if (response != null) {
        if (response.status == 200) {
          emit(SuccessState(OtpScreen.screenName));
        } else if (response.status == 214) {
          emit(ErrorState(response.message.toString()));
        } else {
          emit(ErrorState("Unexpected response status: ${response.status}"));
        }
      } else {
        emit(HideLoadingState());
        emit(ErrorState("Response is null"));
      }
    } catch (e) {
      emit(HideLoadingState());

      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class LoginState {}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends LoginState {
  String screenName;
  SuccessState(this.screenName);
}

class HideLoadingState extends LoginState {}

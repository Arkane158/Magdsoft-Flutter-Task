import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/api/api_manager.dart';
import 'package:magdsoftfluttertask/model/ui/otp/otp_screen.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(LoadingState());
  void login(String name, String phone) async {
    try {
      var response = await ApliManager.loginRequest(name, phone);

      if (response.status == 200) {
        emit(SuccsessState(OtpScreen.screenName));
      }
      if (response.status == 214) {
        emit(ErrorState(response.message.toString()));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class LoginState {}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccsessState extends LoginState {
  String screenName;
  SuccsessState(this.screenName);
}

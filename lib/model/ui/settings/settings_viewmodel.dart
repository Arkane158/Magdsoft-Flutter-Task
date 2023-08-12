import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/api/api_manager.dart';
import 'package:magdsoftfluttertask/model/api/response/help.dart';

class SettingsViewModel extends Cubit<SettingsState> {
  SettingsViewModel() : super(LoadingState());
  getHelp() async {
    try {
      var response = await ApliManager.getHelp();
      if (response.status == 200) {
        emit(SuccessState(response.help));
      } else if (response.status != 200) {
        emit(ErrorState(response.message.toString()));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class SettingsState {}

class LoadingState extends SettingsState {}

class ErrorState extends SettingsState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends SettingsState {
  List<Help>? help;
  SuccessState(this.help);
}

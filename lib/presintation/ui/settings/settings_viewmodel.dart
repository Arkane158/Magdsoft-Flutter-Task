import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/domain/usecases/help_usecase.dart';

import '../../../domain/model/help.dart';

class SettingsViewModel extends Cubit<SettingsState> {
  HelpUsecase usecase;
  SettingsViewModel(this.usecase) : super(LoadingState());
  getHelp() async {
    try {
      var response = await usecase.invoke();
      if (response != null) {
        emit(SuccessState(response));
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

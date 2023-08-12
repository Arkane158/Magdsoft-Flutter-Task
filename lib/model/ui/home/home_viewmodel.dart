import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/model/api/api_manager.dart';
import 'package:magdsoftfluttertask/model/api/response/product.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(LoadingState());
  getProducts() async {
    try {
      var response = await ApliManager.getProducts();
      if (response.isEmpty) {
        emit(ErrorState('Something went wrong'));
      }
      if (response.isNotEmpty) {
        emit(SucessState(response));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SucessState extends HomeState {
  List<Products> products;
  SucessState(this.products);
}

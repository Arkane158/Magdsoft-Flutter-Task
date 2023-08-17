import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/domain/usecases/product_usecase.dart';

import '../../../domain/model/product.dart';

class HomeViewModel extends Cubit<HomeState> {
  ProductUsecase usecase;
  HomeViewModel(this.usecase) : super(LoadingState());
  
  getProducts(String selectedBrand) async {
    try {
      var response = await usecase.invoke(selectedBrand);
      if (response==null) {
        emit(ErrorState('Something went wrong'));
      }
      if (response!=null) {
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

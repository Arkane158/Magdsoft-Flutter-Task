import 'package:magdsoftfluttertask/data/repository/product_repo_imp.dart';
import 'package:magdsoftfluttertask/domain/usecases/product_usecase.dart';

injectProductUseCase() {
  return ProductUsecase(injectProductRepository());
}

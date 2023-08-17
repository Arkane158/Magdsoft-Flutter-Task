import 'package:magdsoftfluttertask/domain/model/product.dart';
import 'package:magdsoftfluttertask/domain/repository/product_repo_contract.dart';

class ProductUsecase {
  ProductRepositoryContract repository;
  ProductUsecase(this.repository);
  Future<List<Products>?> invoke(String company) async {
    var data = await repository.getProduct();
    var filteredData =
        data.where((products) => products.company == company).toList();
    if (company == 'All') return data;
    return filteredData;
  }
}

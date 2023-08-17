import 'package:magdsoftfluttertask/domain/datasource/product_datasource_contract.dart';
import 'package:magdsoftfluttertask/data/api/api_manager.dart';
import 'package:magdsoftfluttertask/domain/model/product.dart';

class ProductDataSourceImplementation implements ProductDataSourceContract {
  ApliManager apliManager;
  ProductDataSourceImplementation(this.apliManager);

  @override
  Future<List<Products>> getProducts() async {
    var response = await apliManager.getProducts();
    return response
        .map((productsDto) => productsDto.toDomainProducts())
        .toList();
  }
}

ProductDataSourceImplementation injectProductDataSource() {
  return ProductDataSourceImplementation(ApliManager.getInstance());
}

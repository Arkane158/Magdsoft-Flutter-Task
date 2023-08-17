import 'package:magdsoftfluttertask/data/datasource/product_datasource_impl.dart';
import 'package:magdsoftfluttertask/domain/repository/product_repo_contract.dart';

import '../../domain/model/product.dart';

class ProductRepositoryImplementation implements ProductRepositoryContract {
  ProductDataSourceImplementation productDataSourceImplementation;
  ProductRepositoryImplementation(this.productDataSourceImplementation);

  @override
  Future<List<Products>> getProduct() {
    return productDataSourceImplementation.getProducts();
  }
}

ProductRepositoryContract injectProductRepository() {
  return ProductRepositoryImplementation(injectProductDataSource());
}

import 'package:magdsoftfluttertask/domain/model/product.dart';

abstract class ProductDataSourceContract {
  Future<List<Products>> getProducts();
}


import '../model/product.dart';

abstract class ProductRepositoryContract {
  Future<List<Products>> getProduct();
}

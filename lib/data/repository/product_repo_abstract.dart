// data/repository/product_repo_abstract.dart
import 'package:task/data/model/productmodel.dart';

abstract class ProductRepositoryAbstract {
  Future<List<ProductModel>> getProducts();
}

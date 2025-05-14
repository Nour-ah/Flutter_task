// data/repository/product_repo.dart
import 'package:task/core/network/product_api.dart';
import 'package:task/data/model/productmodel.dart';
import 'package:task/data/repository/product_repo_abstract.dart';

class ProductRepository implements ProductRepositoryAbstract {
  final ApiProduct apiService;

  ProductRepository(this.apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      return await apiService.getProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: ${e.toString()}');
    }
  }
}

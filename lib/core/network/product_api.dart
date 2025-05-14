// core/network/product_api.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:task/data/model/productmodel.dart';

class ApiProduct {
  final String baseUrl = 'https://dummyjson.com';

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List productsJson = data['products'];
        return productsJson.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    } catch (ex) {
      throw Exception('Unexpected error: $ex');
    }
  }
}

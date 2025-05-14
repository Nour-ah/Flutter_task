// data/model/productmodel.dart
class ProductModel {
  final int? id;
  final String? title;
  final String description;
  final num price;
  final num discountPercentage;
  final num rating;
  final String? productthumbnail;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.productthumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      price: json['price'] ?? "",
      discountPercentage: json['discountPercentage'] ?? "",
      rating: json['rating'] ?? "",
      productthumbnail: json['thumbnail'],
      images: List<String>.from(json['images'] ?? []),
    );
  }
}

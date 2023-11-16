import 'dart:convert';

import 'package:global_eats/models/catergory.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final int id;
  final String productName;
  final String price;
  int stock;
  final int categoryId;
  final String description;
  final bool status;
  final Category category;
  final List<String> images;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.stock,
    required this.categoryId,
    required this.description,
    required this.status,
    required this.category,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        stock: json["stock"],
        categoryId: json["categoryId"],
        description: json["description"],
        status: json["status"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "stock": stock,
        "categoryId": categoryId,
        "description": description,
        "status": status,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };

  copyWith({
    id,
    productName,
    price,
    stock,
    categoryId,
    description,
    status,
    category,
    images,
  }) {
    return Product(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        categoryId: categoryId ?? this.categoryId,
        description: description ?? this.description,
        status: status ?? this.status,
        category: category ?? this.category,
        images: images ?? this.images);
  }
}

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
  final String? image;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.stock,
    required this.categoryId,
    required this.description,
    required this.status,
    required this.category,
    this.image,
  });
  String? get imageURl {
    if (image == null) {
      return null;
    }
    String url = '$id/$image';
    return url;
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        stock: json["stock"],
        categoryId: json["categoryId"],
        description: json["description"],
        status: json["status"],
        category: Category.fromJson(json["category"]),
        image: json["images"].length == 0 ? null : json["images"][0],
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
        "images": [image],
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
    image,
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
        image: image ?? this.image);
  }
}

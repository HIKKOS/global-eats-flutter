import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  final int id;
  final String productName;
  final String price;
  final int stock;
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
}

class Category {
  final int id;
  final String categoryName;
  final bool status;

  Category({
    required this.id,
    required this.categoryName,
    required this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "status": status,
      };
}

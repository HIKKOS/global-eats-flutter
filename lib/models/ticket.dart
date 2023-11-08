import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
  final int folio;
  final int userId;
  final String total;
  final DateTime createdAt;
  final List<Product> products;

  Ticket({
    required this.folio,
    required this.userId,
    required this.total,
    required this.createdAt,
    required this.products,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        folio: json["folio"],
        userId: json["userId"],
        total: json["total"],
        createdAt: DateTime.parse(json["createdAt"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "userId": userId,
        "total": total,
        "createdAt": createdAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final int productId;
  final String productName;
  final int amount;
  final int price;
  final int ticketsFolio;

  Product({
    required this.id,
    required this.productId,
    required this.productName,
    required this.amount,
    required this.price,
    required this.ticketsFolio,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productId: json["productId"],
        productName: json["productName"],
        amount: json["amount"],
        price: json["price"],
        ticketsFolio: json["ticketsFolio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "productName": productName,
        "amount": amount,
        "price": price,
        "ticketsFolio": ticketsFolio,
      };
}

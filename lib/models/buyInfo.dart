// ignore: file_names
class BuyModel {
  final int productId;
  final String productName;
  final int amount;
  final int price;

  BuyModel(
      {required this.productId,
      required this.productName,
      required this.amount,
      required this.price});
  toJson() => {
        "productId": productId,
        "productName": productName,
        "amount": amount,
        "price": price
      };
}

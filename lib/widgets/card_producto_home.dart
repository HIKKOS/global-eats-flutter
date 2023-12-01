import 'package:flutter/material.dart';
import 'package:global_eats/routes/api_routes.dart';
import 'package:global_eats/themes/app_colors.dart';

class CardProducto extends StatelessWidget {
  const CardProducto({
    super.key,
    required this.productName,
    required this.price,
    required this.stock,
    required this.image,
    this.onPressed,
  });
  final String productName;
  final String price;
  final int stock;
  final String? image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (stock == 0) ? null : onPressed,
        borderRadius: BorderRadius.circular(10),
        splashColor: LightColors.primary.withOpacity(0.2),
        highlightColor: LightColors.primary.withOpacity(0.2),
        child: SizedBox(
            width: 150,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: image == null
                      ? Image.asset(
                          'assets/images/no-image.png',
                          height: 125,
                        )
                      : Image.network(
                          // '${ApiRoutes.img}/$image'
                          'https://th.bing.com/th/id/OIP.HSYrkNFa31pSztw3anN6gwHaHa?rs=1&pid=ImgDetMain',
                          fit: BoxFit.cover,
                          height: 125,
                        ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            productName,
                            maxLines: 2,
                            style: const TextStyle(
                              color: LightColors.primaryDark,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        (stock == 0)
                            ? const Text(
                                'Agotado',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: LightColors.red,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              )
                            : Text(
                                '$stock en stock',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: LightColors.primary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

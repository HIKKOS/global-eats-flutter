import 'package:flutter/material.dart';
import 'package:global_eats/themes/app_colors.dart';

class CardProducto extends StatelessWidget {
  const CardProducto({
    super.key,
    required this.productName,
    required this.price,
    required this.stock,
    required this.images,
    this.onPressed,
  });
  final String productName;
  final String price;
  final int stock;
  final List<String> images;
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
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/no-image.png',
                      width: double.infinity,
                    )),
                const Divider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            productName,
                            maxLines: 2,
                            style: const TextStyle(
                              color: LightColors.grey,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        (stock == 0)
                            ? const Text(
                                'agotado',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: LightColors.red,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              )
                            : Text(
                                '$stock en stock',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: LightColors.primary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
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

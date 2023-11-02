import 'package:flutter/material.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/widgets.dart';

class ProductoView extends StatelessWidget {
  const ProductoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  size: 35,
                ))
          ],
          title: const Text('Detalles'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre',
              style: TextStyle(fontSize: 20, color: LightColors.greyText),
            ),
            CategoryTag(text: 'Categoria'),
            Carrousel(children: [
              Image.network(
                  'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF'),
              Image.network(
                  'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF')
            ]),
            const Text(
              '\$120.50 MXN',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}

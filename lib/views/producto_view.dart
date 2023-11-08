import 'package:flutter/material.dart';
import 'package:global_eats/providers/product_provider.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductoView extends StatelessWidget {
  const ProductoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductosProvider>(
      builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            title: Text(provider.seleccionado.productName),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Carrousel(children: [
                        Image.network(
                            'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF'),
                        Image.network(
                            'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF')
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: LightColors.primary,
                                borderRadius: BorderRadius.circular(5)),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Center(
                              child: ListTile(
                                leading: const Icon(Icons.category_rounded,
                                    color: Colors.white),
                                title: Text(
                                    provider.seleccionado.category.categoryName,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                        Text(
                          '${provider.seleccionado.stock} disponibles',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$ ${provider.seleccionado.price}',
                    style: const TextStyle(
                        color: LightColors.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    provider.seleccionado.description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  (provider.seleccionado.stock < 1)
                      ? const Center(
                          child: Text(
                            'Producto agotado',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    surfaceTintColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Agregar al carrito',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: LightColors.primary),
                                  )),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Comprar',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )))
                          ],
                        )
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:global_eats/providers/categories_provider.dart';
import 'package:global_eats/providers/product_provider.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/navigation_service.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/utils/enums.dart';
import 'package:provider/provider.dart';

import '../widgets/carrousel.dart';
import '../widgets/category_tag.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // carrousel
          SizedBox(
            height: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Carrousel(
                children: [
                  Container(
                    height: 100,
                    width: 350,
                    decoration: const BoxDecoration(color: Colors.amber),
                  )
                ],
              ),
            ),
          ),
          // categorias
          Consumer<CategoriesProvider>(
            builder: (_, provider, __) => SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: provider.state == ProviderState.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryTag(
                            text: provider.categories[index].categoryName,
                            onPressed: () {});
                      },
                    ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('¡Ultimas unidades!',
                style: TextStyle(
                    color: LightColors.greyText,
                    fontWeight: FontWeight.bold,
                    fontSize: 28)),
          ),
          Consumer<ProductosProvider>(
            builder: (_, provider, __) => SizedBox(
              height: 300,
              child: provider.state == ProviderState.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.productos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardProducto(
                            onPressed: () {
                              provider.seleccionado = provider.productos[index];
                              Navigation.pushNamed(
                                  routeName: AppRoutes.detallesProducto);
                            },
                            productName: provider.productos[index].productName,
                            price: provider.productos[index].price,
                            stock: provider.productos[index].stock,
                            images: provider.productos[index].images);
                      },
                    ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('Más vendidos',
                style: TextStyle(
                    color: LightColors.greyText,
                    fontWeight: FontWeight.bold,
                    fontSize: 28)),
          ),
        ]),
      ),
    );
  }
}

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
        onTap: onPressed,
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
                        Text('$stock en stock',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: LightColors.primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 16))
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

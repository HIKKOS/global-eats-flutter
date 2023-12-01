import 'package:flutter/material.dart';
import 'package:global_eats/providers/categories_provider.dart';
import 'package:global_eats/providers/product_provider.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/navigation_service.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/utils/enums.dart';
import 'package:global_eats/widgets/card_producto_home.dart';
import 'package:provider/provider.dart';

import '../widgets/carrousel.dart';
import '../widgets/category_tag.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Carrousel(
                children: [
                  ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/antojo.png',
                        height: 100,
                      ),
                      // Container(
                      //   height: 100,
                      //   decoration: const BoxDecoration(color: Colors.amber),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/sed.png'),
                  ),
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
                        final category = provider.categories[index];
                        return CategoryTag(
                            text: category.categoryName,
                            onPressed: () {
                              provider.selectedCategory = category;
                              Navigation.pushNamed(
                                  routeName: AppRoutes.productsByCategory);
                            });
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
              height: 250,
              child: provider.state == ProviderState.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.productos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final producto = provider.productos[index];

                        return CardProducto(
                            onPressed: () {
                              provider.seleccionado = producto;
                              Navigation.pushNamed(
                                  routeName: AppRoutes.detallesProducto);
                            },
                            productName: producto.productName,
                            price: producto.price,
                            stock: producto.stock,
                            image: producto.imageURl);
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

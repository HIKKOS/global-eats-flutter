import 'package:flutter/material.dart';
import 'package:global_eats/models/product.dart';
import 'package:global_eats/providers/categories_provider.dart';
import 'package:global_eats/providers/product_provider.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/navigation_service.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (_, categoryProvider, __) => Scaffold(
        appBar: AppBar(
          title: Text(categoryProvider.selectedCategory.categoryName),
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: (categoryProvider.productos == null)
              ? const Center(child: CircularProgressIndicator())
              : (categoryProvider.productos!.isEmpty)
                  ? const Center(child: Text('No hay productos'))
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: categoryProvider.productos!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final producto = categoryProvider.productos![index];

                        return _CardProducto(
                            producto: producto,
                            onPressed: () {
                              Provider.of<ProductosProvider>(context,
                                      listen: false)
                                  .seleccionado = producto;
                              Navigation.pushNamed(
                                  routeName: AppRoutes.detallesProducto);
                            });
                      },
                    ),
        ),
      ),
    );
  }
}

class _CardProducto extends StatelessWidget {
  const _CardProducto({
    required this.producto,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  final Product producto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 150,
        child: Card(
            child: InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/no-image.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(producto.productName,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20)),
                    const SizedBox(height: 40),
                    Text('${producto.stock} restantes'),
                  ],
                ),
              ),
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text('\$${producto.price}',
                          style: const TextStyle(
                              color: LightColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)))),
            ],
          ),
        )));
  }
}

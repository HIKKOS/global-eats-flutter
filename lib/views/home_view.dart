import 'package:flutter/material.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/busqueda_input.dart';

import '../widgets/carrousel.dart';
import '../widgets/category_tag.dart';

const _categories = ['chinese', 'sodas', 'pasta', 'candies', 'food'];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          IconButton(
              onPressed: () {
                Navigation.pushNamed(routeName: AppRoutes.shoppingCart);
              },
              icon: const Icon(Icons.shopping_cart_rounded))
        ],
        title: BusquedaInput(
            hintText: 'Bucar productos',
            onFieldSubmitted: (value) {},
            onClear: () {}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryTag(
                      text: _categories[index], onPressed: () {});
                },
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
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProducto(
                    index: index,
                  );
                },
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
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProducto(
                    index: index,
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class CardProducto extends StatelessWidget {
  const CardProducto({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network(
                  'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
                  width: double.infinity,
                ),
              ),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mi producto a precio con descuento de la categoria $index',
                        maxLines: 2,
                        style: const TextStyle(
                          color: LightColors.grey,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        ' \$${index * 100}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(' $index en stock',
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
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/widgets/busqueda_input.dart';

const _categories = ['chinese', 'sodas', 'pasta', 'candies', 'food'];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigation.pushNamed(routeName: AppRoutes.shoppingCart);
              },
              icon: const Icon(Icons.shopping_cart_rounded))
        ],
        title: SizedBox(
          child: BusquedaInput(
              hintText: 'Bucar productos',
              onFieldSubmitted: (value) {},
              onClear: () {}),
        ),
      ),
      body: Column(children: [
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
              return _CategoryTag(text: _categories[index], onPressed: () {});
            },
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Mi producto $index',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.network(
                            'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
                            width: double.infinity,
                          ),
                        ),
                        const Divider(),
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                ' \$${index * 100}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(' $index en stock',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                            )
                          ],
                        )
                      ],
                    )),
              );
            },
          ),
        )
      ]),
    );
  }
}

class _CategoryTag extends StatelessWidget {
  const _CategoryTag({
    required this.text,
    this.onPressed,
  });
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class Carrousel extends StatelessWidget {
  const Carrousel({
    super.key,
    required this.children,
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          pageViewKey: const PageStorageKey('carousel'),
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 2500),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          height: double.infinity,
          aspectRatio: 1,
          viewportFraction: 1),
      items: children,
    );
  }
}

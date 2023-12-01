import 'package:flutter/material.dart';
import 'package:global_eats/routes/app_routes.dart';

import '../services/services.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    int index = 500;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrito',
        ),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .74,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCartWidget(
                          index: index,
                          deviceWidth: deviceWidth,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x27000000),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$$index',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: const Center(
                            child: Text("Continuar Compra"),
                          ),
                        ),
                        onPressed: () {
                          Navigation.pushNamed(routeName: AppRoutes.buyProduct);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget({
    super.key,
    required this.index,
    required this.deviceWidth,
  });

  final int index;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
                    height: 50,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: deviceWidth * .65,
                        child: const Text(
                          'Maruchan de 10 pesos que vale 5 pesos pero que se vende a 20',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Eliminar'),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: const Text("-"),
                            ),
                            Text('$index'),
                            TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () {},
                              child: const Text("+"),
                            ),
                          ],
                        ),
                      ),
                      const Text('\$500')
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:global_eats/models/buyInfo.dart';
import 'package:global_eats/providers/product_provider.dart';
import 'package:global_eats/providers/user_provider.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

int _cantidadProducto = 1;

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
                      child: provider.seleccionado.images.isEmpty
                          ? Image.asset('assets/images/no-image.png')
                          : Carrousel(
                              children: provider.seleccionado.images
                                  .map((String e) => Image.network(e))
                                  .toList()),
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
                                    onPressed: () {
                                      showModalBottomSheet(
                                          enableDrag: true,
                                          showDragHandle: true,
                                          context: context,
                                          builder: (_) {
                                            return BottomSheet(
                                                onClosing: () {},
                                                builder: (_) {
                                                  return SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.3,
                                                    child: const Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      16.0),
                                                          child: Text(
                                                            'Cantidad',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Elige la cantidad de productos a comprar',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        _ProductoCounter(),
                                                        _BuyButton()
                                                      ],
                                                    ),
                                                  );
                                                });
                                          });
                                    },
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

class _BuyButton extends StatefulWidget {
  const _BuyButton({
    super.key,
  });

  @override
  State<_BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<_BuyButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductosProvider, UserProvider>(
      builder: (_, prodProv, userProv, __) => isLoading
          ? const ElevatedButton(
              onPressed: null, child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: () async {
                isLoading = true;
                setState(() {});
                final producto = prodProv.seleccionado;
                final misProductos = [
                  BuyModel(
                      productId: producto.id,
                      productName: producto.productName,
                      amount: _cantidadProducto,
                      price: int.parse(producto.price))
                ];
                final res = await userProv.buy(misProductos);

                if (res) {
                  Toast.showToast('Compra exitosa');
                  await userProv.fetchTickets();
                  prodProv.seleccionadoCount = _cantidadProducto;
                  Navigation.popTwice();
                } else {
                  Toast.showToast('Algo salio mal');
                }
                isLoading = false;
                setState(() {});
              },
              child: const Text('Comprar')),
    );
  }
}

class _ProductoCounter extends StatefulWidget {
  const _ProductoCounter();

  @override
  State<_ProductoCounter> createState() => _ProductoCounterState();
}

class _ProductoCounterState extends State<_ProductoCounter> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductosProvider>(
      builder: (_, provider, __) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                if (_cantidadProducto == 1) return;
                _cantidadProducto--;
                setState(() {});
              },
              icon: Icon(Icons.remove_rounded)),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
            child: Center(child: Text(_cantidadProducto.toString())),
          ),
          IconButton(
              onPressed: () {
                if (_cantidadProducto == provider.seleccionado.stock) return;
                _cantidadProducto++;
                setState(() {});
              },
              icon: Icon(Icons.add_rounded))
        ],
      ),
    );
  }
}

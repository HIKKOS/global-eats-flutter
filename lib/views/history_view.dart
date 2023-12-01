import 'package:flutter/material.dart';
import 'package:global_eats/models/ticket.dart';
import 'package:global_eats/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<UserProvider>(
        builder: (_, provider, __) => (provider.tickets.isEmpty)
            ? const _EmptyHistory()
            : const _History(),
      ),
    );
  }
}

class _History extends StatelessWidget {
  const _History();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (_, provider, __) => SizedBox(
            height: MediaQuery.sizeOf(context).height * .90,
            child: RefreshIndicator(
              onRefresh: () async {
                await provider.fetchTickets();
              },
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: provider.products.keys.length,
                itemBuilder: (_, int ticketIndex) {
                  final fecha = provider.products.entries.toList()[ticketIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Comprado el: ${fecha.key}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: fecha.value.length,
                          itemBuilder: (_, productIndex) {
                            final product = fecha.value[productIndex];
                            return HistoryProductWidget(
                              product: product,
                            );
                          }),
                    ],
                  );
                },
              ),
            )));
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.history,
          size: 100,
          color: Colors.grey,
        ),
        Text(
          'Aqui se mostraran tus compras',
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ],
    );
  }
}

class HistoryProductWidget extends StatelessWidget {
  const HistoryProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Compraste: ${product.amount}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Comprado',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: .2,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/no-image.png',
                          height: 80,
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * .60,
                                child: Text(
                                  product.productName,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   style: TextButton.styleFrom(
                              //     padding: EdgeInsets.zero,
                              //     splashFactory: NoSplash.splashFactory,
                              //   ),
                              //   child: const Text('Volver a comprar'),
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

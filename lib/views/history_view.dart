import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    var formatToday = DateFormat.yMMMMd().format(today);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          height: screenHeight * .90,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return HistoryProductWidget(
                  screenWidth: screenWidth, formatToday: formatToday);
            },
          )),
    );
  }
}

class HistoryProductWidget extends StatelessWidget {
  const HistoryProductWidget({
    super.key,
    required this.screenWidth,
    required this.formatToday,
  });

  final double screenWidth;
  final String formatToday;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: screenWidth,
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
                            formatToday,
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
                        Image.network(
                          'https://i5.walmartimages.com/asr/e2d76553-f239-4e9e-94fa-148a8d43fc4a_2.7da2b067e03b435d1154874b4cf9463b.png?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * .60,
                                child: const Text(
                                  'Maruchan de 10 pesos que vale 5 pesos pero que se vende a 20',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
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

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi consumo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: PieChart(PieChartData(
            sections: [
              PieChartSectionData(
                value: 1,
                title: 'Refrescos',
                showTitle: true,
                radius: 70,
                color: Color(0xFFAB3EAA),
              ),
              PieChartSectionData(
                value: 2,
                title: 'Sopas',
                showTitle: true,
                radius: 70,
                color: Color(0xFFFFFFFF),
              ),
              PieChartSectionData(
                value: 3,
                title: 'Dulces',
                showTitle: true,
                radius: 70,
                color: Color(0xFFDFEFAF),
              ),
              PieChartSectionData(
                value: 3,
                title: 'Snacks',
                showTitle: true,
                radius: 70,
                color: Color(0xFFAB2A2A),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

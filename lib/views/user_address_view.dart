import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direcciones'),
      ),
      body: SizedBox(
        child: Text('Direcciones'),
      ),
    );
  }
}

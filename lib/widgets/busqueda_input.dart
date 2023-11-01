import 'package:flutter/material.dart';
import '/services/services.dart';

import '../themes/theme.dart';

class BusquedaInput extends StatelessWidget {
  final String? initialValue, hintText;
  final Function(String?) onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback onTapSort, onClear;

  /// El [formProperty] es la propiedad que se va a actualizar generalmente
  /// obtenida de un Map.
  /// El [formValues] es el Map que contiene los valores del formulario.
  /// El [controller] es el controlador del campo de texto.
  /// El [onFieldSubmitted] es la función que se ejecuta al presionar enter.
  /// El [focusNode] es el nodo de enfoque del campo de texto.
  /// El [hintText] es el texto que se muestra cuando el campo está vacío.
  /// El [initialValue] es el valor inicial del campo de texto.
  /// El [onClear] es la función que se ejecuta al presionar el botón de borrar.
  /// El [onTapSort] es la función que se ejecuta al presionar el botón de ordenar.
  const BusquedaInput({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.onFieldSubmitted,
    required this.focusNode,
    this.hintText = 'Buscar',
    this.initialValue,
    required this.onClear,
    required this.onTapSort,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        cursorColor:
            Preferences.isDarkMode ? LightColors.primary : DarkColors.primary,
        autofocus: false,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  child: const Icon(Icons.clear, size: 30),
                  onTap: () {
                    controller.clear();
                    FocusScope.of(context).unfocus();
                    onClear();
                    controller.text = initialValue ?? '';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    onTapSort();
                  },
                  child: const Icon(Icons.sort, size: 30),
                ),
              )
            ],
          ),
        ));
  }
}

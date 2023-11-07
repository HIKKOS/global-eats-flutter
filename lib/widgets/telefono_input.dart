import 'package:flutter/material.dart';
import 'package:global_eats/themes/app_colors.dart';

class TelefonoInput extends StatelessWidget {
  final String? label;

  final String? initialValue;
  final void Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool withoutValidation;

  const TelefonoInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.validator,
    this.label,
  }) : withoutValidation = false;

  const TelefonoInput.withoutValidation({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
  })  : validator = null,
        withoutValidation = true;

  @override
  Widget build(BuildContext context) {
    String? validationFunction(String? value) {
      final bool isEmpty = value == null || value.isEmpty;
      if (isEmpty) return 'Por favor ingrese algo';
      final bool isNotNumeric = double.tryParse(value) == null;
      if (isNotNumeric) return 'Por favor ingrese un número de teléfono válido';
      if (value.length < 10) {
        return 'Por favor ingrese un número de teléfono válido';
      }
      return null;
    }

    var validator = (withoutValidation) ? null : validationFunction;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? 'Teléfono',
            style: const TextStyle(
              color: LightColors.primaryDark,
              fontSize: 18,
            )),
        const SizedBox(height: 10),
        TextFormField(
            style: const TextStyle(color: LightColors.greyText),
            controller: controller ?? TextEditingController(text: initialValue),
            cursorColor: LightColors.primary,
            autofocus: false,
            keyboardType: TextInputType.phone,
            onChanged: onChanged,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Número de teléfono',
              prefixIcon: Icon(Icons.phone_rounded),
            )),
      ],
    );
  }
}

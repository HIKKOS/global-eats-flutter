import 'package:flutter/material.dart';
import '/themes/theme.dart';

class UsuarioInput extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final String? hintText;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool withoutValidation;

  const UsuarioInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
  }) : withoutValidation = false;

  const UsuarioInput.withoutValidation({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
    this.hintText,
  })  : validator = null,
        withoutValidation = true;

  @override
  Widget build(BuildContext context) {
    String? validationFunction(String? value) {
      final bool isEmpty = value == null || value.isEmpty;
      if (isEmpty) return 'Por favor ingrese algo';
      return null;
    }

    var validator = (withoutValidation) ? null : validationFunction;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? 'Nombre de usuario',
            style: const TextStyle(
              color: LightColors.primaryDark,
              fontSize: 18,
            )),
        const SizedBox(height: 10),
        TextFormField(
            style: const TextStyle(color: LightColors.greyText),
            controller: controller,
            cursorColor: LightColors.primary,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hintText,
              prefixIcon: const Icon(Icons.person_rounded),
            )),
      ],
    );
  }
}

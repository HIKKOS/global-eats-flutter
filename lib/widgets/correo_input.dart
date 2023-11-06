import 'package:flutter/material.dart';
import '/themes/theme.dart';

class CorreoInput extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
  final bool withoutValidation;

  const CorreoInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
  }) : withoutValidation = false;

  const CorreoInput.withoutValidation({
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
      final RegExp regExp = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      final bool isEmpty = value == null || value.isEmpty;
      if (isEmpty) return 'Por favor ingrese algo';
      final bool emailValid = regExp.hasMatch(value);
      if (!emailValid) return 'Por favor ingrese un correo válido';
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
            controller: controller ?? TextEditingController(text: initialValue),
            cursorColor: DarkColors.primary,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: hintText ?? 'Correo electrónico',
              prefixIcon: const Icon(Icons.email_rounded),
            )),
      ],
    );
  }
}

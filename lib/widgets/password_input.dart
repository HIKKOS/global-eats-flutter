import 'package:flutter/material.dart';
import '/themes/theme.dart';

class PasswordInput extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final VoidCallback? setIsObscure;
  const PasswordInput({
    super.key,
    required this.onChanged,
    required this.setIsObscure,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.obscureText = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        cursorColor: DarkColors.primary,
        autofocus: false,
        keyboardType: TextInputType.text,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: (value) =>
            value == null || value.isEmpty ? 'Por favor ingrese algo' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: const Icon(Icons.lock_rounded),
          suffixIcon: IconButton(
              onPressed: setIsObscure,
              icon: Icon(
                obscureText
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 30,
              )),
        ));
  }
}

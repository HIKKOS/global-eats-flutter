import 'package:flutter/material.dart';
import '/themes/theme.dart';

class PasswordInput extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const PasswordInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextFormField(
            controller: widget.controller,
            cursorColor: DarkColors.primary,
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: isObscure,
            onChanged: widget.onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese una contraseña';
              }
              if (value.length < 8) {
                return 'La contraseña debe tener almenos 8 caracteres';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: const Icon(Icons.lock_rounded),
              suffixIcon: IconButton(
                  onPressed: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 30,
                  )),
            ))
      ],
    );
  }
}

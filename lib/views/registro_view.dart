import 'package:flutter/material.dart';
import 'package:global_eats/providers/user_provider.dart';

import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/theme.dart';

import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> _formData = {
  "firstName": "",
  "lastName": "",
  "phone": "",
  "email": "",
  "userPassword": "",
};
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class RegistroView extends StatelessWidget {
  const RegistroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          color: LightColors.primary,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    right: -80,
                    child: Transform.flip(
                      flipX: true,
                      child: Icon(Icons.person_add_alt_1_rounded,
                          size: 200, color: Colors.white.withOpacity(0.2)),
                    )),
                Positioned(
                  left: 20,
                  top: 80,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text('Registro',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 36)),
                  ),
                ),
                Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigation.pop(),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    right: 20,
                    left: 20.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: UsuarioInput(
                                    label: 'Nombre completo',
                                    hintText: 'Nombre',
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        _formData['firstName'] = value;
                                      }
                                    }),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: UsuarioInput(
                                    label: '',
                                    hintText: 'Apellido',
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        _formData['lastName'] = value;
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: TelefonoInput(onChanged: (String? value) {
                            if (value == null) return;
                            final bool isNotNumeric =
                                double.tryParse(value) == null;
                            if (isNotNumeric) return;

                            _formData['phone'] = value;
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: CorreoInput(onChanged: (String? value) {
                            if (value != null) _formData['email'] = value;
                          }),
                        ),
                        PasswordInput(
                          onChanged: (String? value) {
                            if (value != null) {
                              _formData['userPassword'] = value;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0, right: 20, left: 20),
                child: _RegistroButton(),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}

class _RegistroButton extends StatefulWidget {
  const _RegistroButton();

  @override
  State<_RegistroButton> createState() => _RegistroButtonState();
}

class _RegistroButtonState extends State<_RegistroButton> {
  bool isLocked = false;
  @override
  Widget build(BuildContext context) {
    if (isLocked) {
      return const SizedBox(
        height: 50,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return Consumer<UserProvider>(
      builder: (_, provider, __) => ElevatedButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            isLocked = true;
            setState(() {});
            try {
              final result = await provider.registroUsuario(_formData);
              if (result) {
                Toast.showToast('Usuario registrado correctamente');
                Navigation.pop();
              } else {
                Toast.showToast('Error al registrar usuario');
              }
            } on Exception catch (e) {
              Toast.showToast(e.toString());
            } finally {
              isLocked = false;
              setState(() {});
            }
          },
          child: const SizedBox(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text('Registrarse',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          )),
    );
  }
}

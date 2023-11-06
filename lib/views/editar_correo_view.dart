import 'package:flutter/material.dart';
import 'package:global_eats/models/user.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_colors.dart';

import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

String _correo = '';
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditarCorreoView extends StatelessWidget {
  const EditarCorreoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Correo'),
      ),
      body: Consumer<AuthProvider>(
        builder: (_, provider, __) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      'Es el correo con el que quieres iniciar sesión',
                      style:
                          TextStyle(fontSize: 20, color: LightColors.greyText),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: CorreoInput(
                        initialValue: provider.user!.email,
                        label: 'Correo',
                        onChanged: (String? value) {
                          if (value != null) _correo = value;
                        }),
                  ),
                ],
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: SafeArea(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await Dialogs.showMorph(
                            loadingTitle: 'Actualizando correo',
                            onAcceptPressed: (context) async {
                              User usuario = provider.user!.copyWith(
                                email: _correo,
                              );
                              await provider.updateInfo(usuario);
                              Navigation.pop();
                            },
                            title: '¿Estás seguro?',
                            description:
                                '"$_correo" será tu nuevo correo de inicio de sesión',
                            acceptText: ('Actualizar'),
                            cancelText: ('Cancelar'),
                          );
                        },
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

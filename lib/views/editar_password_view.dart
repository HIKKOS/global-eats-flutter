import 'package:flutter/material.dart';
import 'package:global_eats/models/models.dart';
import 'package:global_eats/models/user.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/providers/providers.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

String _password = '';
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditarPasswordView extends StatelessWidget {
  const EditarPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Contraseña'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'Contraseña con la que inicias sesión',
                          style: TextStyle(
                              fontSize: 20, color: LightColors.greyText),
                        ),
                      ),
                    ),
                    PasswordInput(
                        label: 'Nueva contraseña',
                        onChanged: (String? value) {
                          if (value != null) _password = value;
                        }),
                  ],
                ),
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: SafeArea(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await Dialogs.showMorph(
                            title: 'Actualizar contraseña',
                            loadingTitle: 'Actualizando contraseña',
                            onAcceptPressed: (context) async {
                              String message = '';
                              try {
                                if (!await provider.changePassword(_password)) {
                                  message =
                                      'No se pudo actualizar la contraseña';
                                  return;
                                }
                                message = 'Contraseña actualizada';
                              } on Exception catch (_) {
                                message =
                                    'Algo salió mal, intenta de nuevo más tarde';
                              } finally {
                                Toast.showToast(message,
                                    duration: const Duration(seconds: 2));
                                Navigation.pop();
                              }
                            },
                            description:
                                '¿Estás seguro de que quieres actualizar tu contraseña?',
                            acceptText: ('Aceptar'),
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

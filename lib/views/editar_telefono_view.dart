import 'package:flutter/material.dart';
import 'package:global_eats/models/user.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

String _celular = '';
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditarTelefonoView extends StatelessWidget {
  const EditarTelefonoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Teléfono'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      'Numero de teléfono',
                      style:
                          TextStyle(fontSize: 20, color: LightColors.greyText),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: TelefonoInput(
                        initialValue: provider.user!.phone,
                        onChanged: (String? value) {
                          if (value != null) _celular = value;
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
                            loadingTitle: 'Actualizando teléfono',
                            onAcceptPressed: (context) async {
                              String message = '';
                              try {
                                User usuario = provider.user!.copyWith(
                                  phone: _celular,
                                );
                                if (!await provider.updateInfo(usuario)) {
                                  message =
                                      'Algo salió mal, intenta de nuevo más tarde';
                                  return;
                                }
                                message = 'Se actualizó el teléfono';
                              } on Exception catch (_) {
                                message =
                                    'Algo salió mal, intenta de nuevo más tarde';
                              } finally {
                                Toast.showToast(message,
                                    duration: const Duration(seconds: 2));
                                Navigation.pop();
                              }
                            },
                            title: '¿Estás seguro?',
                            description:
                                '¿Estás seguro de que quieres actualizar tu numero de celular a "$_celular"?',
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

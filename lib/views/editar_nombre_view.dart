import 'package:flutter/material.dart';
import 'package:global_eats/providers/user_provider.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:global_eats/widgets/widgets.dart';
import 'package:provider/provider.dart';

Map _data = {};
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditarNombreView extends StatelessWidget {
  const EditarNombreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nombre'),
      ),
      body: Consumer<UserProvider>(
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
                      'Es el nombre que se muestra en la aplicación',
                      style:
                          TextStyle(fontSize: 20, color: LightColors.greyText),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        UsuarioInput(
                            label: 'Nombre',
                            initialValue: provider.user!.firstName,
                            onChanged: (String? value) {
                              if (value != null) _data['firstName'] = value;
                            }),
                        const SizedBox(height: 20),
                        UsuarioInput(
                            initialValue: provider.user!.lastName,
                            label: 'Apellido',
                            onChanged: (String? value) {
                              if (value != null) _data['lastName'] = value;
                            }),
                      ],
                    ),
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
                              loadingTitle: 'Actualizando información',
                              onAcceptPressed: (context) async {
                                String message = '';
                                try {
                                  Navigation.unFocus();
                                  final user = provider.user!.copyWith(
                                      firstName: _data['_nombre'],
                                      lastName: _data['_lastName']);
                                  if (!await provider.updateInfo(user)) {
                                    message =
                                        'Algo salió mal, intenta de nuevo más tarde';
                                    return;
                                  }
                                  message = 'Se actualizó el nombre';
                                } on Exception catch (_) {
                                  message =
                                      'Algo salió mal, intenta de nuevo más tarde';
                                } finally {
                                  Toast.showToast(message,
                                      duration: const Duration(seconds: 2));
                                  Navigation.pop();
                                }
                              },
                              title: 'Cambiar nombre',
                              description:
                                  '¿Estás seguro de cambiar tu nombre a "${_data['_nombre']} ${_data['_lastName']}"?');
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

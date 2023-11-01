import 'package:flutter/material.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/widgets/correo_input.dart';
import 'package:global_eats/widgets/password_input.dart';
import 'package:provider/provider.dart';

import '../services/navigation_service.dart';

Map _data = {};

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: AppBar(
          title: const Text('LoginView'),
        ),
        body: Column(
          children: [
            CorreoInput(onChanged: (value) {
              _data['correo'] = value;
            }),
            PasswordInput(onChanged: (value) {
              _data['password'] = value;
            }),
            ElevatedButton(
              onPressed: () async {
                final respose = await provider.login(
                  email: _data['correo'],
                  password: _data['password'],
                );
                if (respose) {
                  Navigation.pushReplacementNamed(routeName: AppRoutes.home);
                } else {
                  Toast.showToast('Error al iniciar sesion');
                }
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}

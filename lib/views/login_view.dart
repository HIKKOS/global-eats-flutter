import 'package:flutter/material.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/theme.dart';
import 'package:global_eats/widgets/correo_input.dart';
import 'package:global_eats/widgets/icon.dart';
import 'package:global_eats/widgets/password_input.dart';
import 'package:provider/provider.dart';

Map _data = {};
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, provider, __) => Scaffold(
        body: Column(children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: LightColors.primary),
          ),
          Card(
            child: SizedBox(
              height: 400,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CorreoInput(onChanged: (value) {
                        _data['correo'] = value;
                      }),
                      PasswordInput(onChanged: (value) {
                        _data['password'] = value;
                      }),
                      ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          final respose = await provider.login(
                            email: _data['correo'],
                            password: _data['password'],
                          );
                          if (respose) {
                            Navigation.pushReplacementNamed(
                                routeName: AppRoutes.home);
                          } else {
                            Toast.showToast('Error al iniciar sesion');
                          }
                        },
                        child: const Text('Ingresar'),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                              child: Center(
                                child: Text('Si no tienes una cuenta puedes ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: LightColors.primaryDark)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigation.pushNamed(
                                  routeName: AppRoutes.home),
                              child: const SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text('crear una',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: LightColors.primary)),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

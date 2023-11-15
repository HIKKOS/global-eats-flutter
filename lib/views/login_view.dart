import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_eats/providers/user_provider.dart';
import 'package:global_eats/routes/app_routes.dart';
import 'package:global_eats/services/services.dart';
import 'package:global_eats/themes/theme.dart';
import 'package:global_eats/utils/logger.dart';
import 'package:global_eats/widgets/correo_input.dart';

import 'package:global_eats/widgets/password_input.dart';
import 'package:provider/provider.dart';

Map _data = {};
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: AppBar(
          backgroundColor: LightColors.primary,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const _TopLogo(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: _formKey,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: _FormLogin(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _TopLogo extends StatelessWidget {
  const _TopLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: LightColors.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: 100,
              width: 100,
            ),
            const Expanded(
              child: Text(
                'Global Eats',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text('Bienvenido',
                style: TextStyle(
                    color: LightColors.greyText,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text('Inicia sesión para continuar',
                  style: TextStyle(
                    color: LightColors.grey,
                    fontSize: 20,
                  )),
            ),
          ],
        ),
        Column(
          children: [
            CorreoInput(onChanged: (value) {
              _data['correo'] = value;
            }),
            PasswordInput(onChanged: (value) {
              _data['password'] = value;
            }),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: _LoginButton(),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
            child: Center(
              child: Text('Si no tienes una cuenta puedes ',
                  style:
                      TextStyle(fontSize: 16, color: LightColors.primaryDark)),
            ),
          ),
          GestureDetector(
            onTap: () => Navigation.pushNamed(routeName: AppRoutes.singIn),
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
    );
  }
}

class _LoginButton extends StatefulWidget {
  const _LoginButton();

  @override
  State<_LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_LoginButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) => ElevatedButton(
        onPressed: () async {
          try {
            isLoading = true;
            setState(() {});
            Navigation.unFocus();
            if (!_formKey.currentState!.validate()) return;
            final respose = await provider.login(
              email: _data['correo'],
              password: _data['password'],
            );
            if (respose) {
              Navigation.pushReplacementNamed(routeName: AppRoutes.home);
            } else {
              Toast.showToast('Usuario o contraseña incorrectos');
            }
          } on Exception catch (e) {
            Toast.showToast(e.toString());
            Loggerify.debug(e.toString());
          } finally {
            isLoading = false;
            setState(() {});
          }
        },
        child: isLoading
            ? const SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : const Text(
                'Ingresar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

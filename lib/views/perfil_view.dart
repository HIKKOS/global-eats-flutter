import 'package:flutter/material.dart';
import 'package:global_eats/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/navigation_provider.dart';
import '../routes/app_routes.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import '../themes/app_colors.dart';

class PerfilView extends StatelessWidget {
  const PerfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, __) {
      if (provider.user == null) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: LightColors.primary,
                child: SafeArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          left: 60,
                          child: Text(
                            provider.user!.firstName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40),
                          )),
                      Positioned(
                          right: -80,
                          child: Icon(Icons.person_rounded,
                              size: MediaQuery.of(context).size.height * 0.25,
                              color: Colors.white.withOpacity(0.2))),
                    ],
                  ),
                ),
              ),
              const _ListaElementos()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 70,
              child: Consumer2<UserProvider, NavigationProvider>(
                builder: (__, authProvider, navigationProvider, _) =>
                    ElevatedButton.icon(
                  onPressed: () => Dialogs.showMorph(
                    title: 'Cerrar sesión',
                    loadingTitle: 'Cerrando sesión',
                    description: '¿Estás seguro que deseas cerrar sesión?',
                    onAcceptPressed: (context) async {
                      await authProvider.logout();
                      navigationProvider.clear();
                      await Navigation.pushNamedAndRemoveUntil(
                          predicate: (route) => false,
                          routeName: AppRoutes.login);
                    },
                  ),
                  icon: const Icon(Icons.logout_rounded, size: 35),
                  label: const Text(
                    'Cerrar sesión',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}

class _ListaElementos extends StatelessWidget {
  const _ListaElementos();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, __) {
      final User usuario = provider.user!;
      return Column(
        children: [
          _AjustesTile(
            title: 'Nombre',
            subtitle: usuario.firstName,
            route: AppRoutes.editarNombre,
            icon: Icons.person_rounded,
          ),
          _AjustesTile(
            icon: Icons.email_rounded,
            route: AppRoutes.editarCorreo,
            title: 'Correo electrónico',
            subtitle: usuario.email,
          ),
          _AjustesTile(
            icon: Icons.phone_rounded,
            route: AppRoutes.editarTelefono,
            title: 'Teléfono',
            subtitle: usuario.phone,
          ),
          _AjustesTile(
            icon: Icons.lock_rounded,
            route: AppRoutes.editarPassword,
            title: 'Contraseña',
            subtitle: 'Editar',
          ),
          _AjustesTile(
              title: 'Consumos',
              route: AppRoutes.addresses,
              icon: Icons.pie_chart)
        ],
      );
    });
  }
}

class _AjustesTile extends StatelessWidget {
  const _AjustesTile({
    required this.title,
    this.subtitle,
    required this.route,
    required this.icon,
  });
  final String title, route;
  final String? subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: LightColors.primary,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          icon,
          color: LightColors.grey,
        ),
      ),
      onTap: () => Navigation.pushNamed(routeName: route),
      title: Text(
        title,
        style: const TextStyle(
            color: LightColors.greyText,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

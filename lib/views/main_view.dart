import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:global_eats/providers/auth_provider.dart';
import 'package:global_eats/providers/categories_provider.dart';
import 'package:global_eats/providers/product_provider.dart';
import 'package:global_eats/themes/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../routes/app_routes.dart';
import '../services/services.dart';
import '../widgets/busqueda_input.dart';

bool _exit = false;

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductosProvider>(context, listen: false).fetchProductos();
      Provider.of<CategoriesProvider>(context, listen: false).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) => WillPopScope(
          onWillPop: () async {
            if (navigationProvider.index != 0) {
              navigationProvider.jumpToPage(0);
              return false;
            }
            if (!_exit) {
              Toast.showToast(
                'Presiona de nuevo para salir',
                showCloseIcon: false,
                duration: const Duration(seconds: 1),
              );
              _exit = true;
              Future.delayed(const Duration(seconds: 1), () {
                _exit = false;
              });
              return false;
            }
            return true;
          },
          child: Scaffold(
            appBar: _buildAppBar(navigationProvider.index),
            body: PageView(
              controller: navigationProvider.pageController,
              children: navigationProvider.pages,
              onPageChanged: (index) => navigationProvider.index = index,
            ),
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: LightColors.primary,
              selectedIndex: navigationProvider.index,
              showElevation: true,
              itemCornerRadius: 8,
              curve: Curves.easeInBack,
              onItemSelected: (int index) async {
                await navigationProvider.jumpToPage(index);
              },
              items: _bottomItems,
            ),
          )),
    );
  }
}

AppBar _buildAppBar(int index) {
  late AppBar appBar;

  List<Widget> actions = [
    IconButton(
        onPressed: () {
          Navigation.pushNamed(routeName: AppRoutes.shoppingCart);
        },
        icon: const Icon(Icons.shopping_cart_rounded))
  ];
  Map<int, String> titles = {
    0: 'Inicio',
    1: 'Historial de compras',
    2: 'Mis Datos',
    /* 3: 'Videos',
    4: 'Perfil' */
  };

  appBar = AppBar(
    toolbarHeight: 100,
    title: Consumer<AuthProvider>(builder: (_, provider, __) {
      if (index == 0) {
        return BusquedaInput(
            hintText: 'Bucar productos',
            onFieldSubmitted: (value) {},
            onClear: () {});
      }
      if (titles[index] != null) {
        return Text('${titles[index]}');
      } else {
        return const Text('');
      }
    }),
    actions: (index != titles.values.length - 1) ? actions : null,
  );
  return appBar;
}

List<BottomNavyBarItem> _bottomItems = [
  _buildBottomNavyBarItem(
    'Inicio',
    Icons.home_rounded,
  ),
  //_buildBottomNavyBarItem('Compras', Icons.shopping_bag_rounded),
  _buildBottomNavyBarItem(
    'Historial',
    Icons.history,
  ),
  _buildBottomNavyBarItem(
    'Perfil',
    Icons.person_2_rounded,
  ),
];
BottomNavyBarItem _buildBottomNavyBarItem(String title, IconData icon) {
  return BottomNavyBarItem(
    icon: Icon(icon),
    title: Text(title),
    activeColor: Colors.white,
    inactiveColor: const Color(0xff1D4244),
    textAlign: TextAlign.center,
  );
}

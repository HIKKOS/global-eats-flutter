import 'package:flutter/material.dart';
import 'package:global_eats/views/perfil_view.dart';

import '../views/views.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationProvider() : _pageControlller = PageController(initialPage: 0);
  late final PageController _pageControlller;
  int _index = 0;
  int get index => _index;
  set index(int index) {
    _index = index;
    notifyListeners();
  }

  void clear() {
    _index = 0;
    notifyListeners();
  }

  Future<void> animateToPage(int index) async {
    _index = index;
    await _pageControlller.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  Future<void> jumpToPage(int index) async {
    _index = index;
    _pageControlller.jumpToPage(index);
    notifyListeners();
  }

  final List<Widget> _pages = [
    const HomeView(),
    const PerfilView(),
  ];
  List<Widget> get pages => _pages;

  PageController get pageController => _pageControlller;
}

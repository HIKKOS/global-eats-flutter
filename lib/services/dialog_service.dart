import 'package:flutter/material.dart';

import '../utils/utils.dart';

class Dialogs {
  static GlobalKey<NavigatorState> navigatorKey = NavigationKey.navigatorKey;

  /// Muestra un dialog que de ser aceptado [onAcceptPressed] se ejecutará.
  /// Impidiendo al usuario poder cerrar el dialogo.
  static Future<dynamic> showAlert({
    required AlertDialog dialog,
  }) {
    return showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) {
          return dialog;
        });
  }
}

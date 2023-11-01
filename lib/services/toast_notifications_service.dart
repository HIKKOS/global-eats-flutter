import 'package:flutter/material.dart';

class Toast {
  static final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;
  static void hideCurrentSnackBar() {
    return _messengerKey.currentState!
        .hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
  }

  static void showToast(
    String message, {
    bool? showCloseIcon = true,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    SnackBarAction? action,
  }) {
    hideCurrentSnackBar();
    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        elevation: 10,
        behavior: SnackBarBehavior.fixed,
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        showCloseIcon: showCloseIcon,
        animation: const AlwaysStoppedAnimation(0),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }
}

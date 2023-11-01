import 'package:flutter/material.dart';

import '../themes/theme.dart';

class Toast {
  static final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;
  static void hideCurrentSnackBar() {
    return _messengerKey.currentState!
        .hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
  }

  static SnackBar _buildSnackbar(
          {required String text,
          Duration? duration,
          required Color backgroundColor,
          required bool isDarkMode,
          Color textColor = Colors.white,
          Color iconColor = Colors.white,
          required Icon icon}) =>
      SnackBar(
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: icon),
                Expanded(
                    flex: 7,
                    child: Text(' $text',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: textColor,
                        ))),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                    onTap: () => hideCurrentSnackBar(),
                    child: Icon(
                      Icons.close_rounded,
                      color: iconColor,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(milliseconds: 1700),
      );
}

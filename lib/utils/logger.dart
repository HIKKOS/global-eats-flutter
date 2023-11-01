import 'package:logger/logger.dart';

class Loggerify {
  static final Logger _logger = Logger();
  static void error(String message) {
    _logger.e(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void debug(String message) {
    _logger.d(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }
}

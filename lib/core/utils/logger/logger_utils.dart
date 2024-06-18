// ignore_for_file: prefer_constructors_over_static_methods

import 'package:logger/logger.dart';

class LoggerUtils {
  LoggerUtils._();

  static LoggerUtils? _instance;

  static LoggerUtils get instance {
    _instance ??= LoggerUtils._();
    return _instance!;
  }

  final Logger _logger = Logger(printer: PrettyPrinter(stackTraceBeginIndex: 2));

  void logInfo(String message) {
    _logger.i(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }

  void logError(String message) {
    _logger.e(message);
  }

  void logFatalError(String message, StackTrace? stackTrace) {
    _logger.f(message, stackTrace: stackTrace);
  }
}

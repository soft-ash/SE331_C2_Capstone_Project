import 'dart:developer' as developer;

class AppLogger {
  AppLogger._();

  static void info(String message) {
    developer.log('[INFO] $message', name: 'AppLogger');
  }

  static void success(String message) {
    developer.log('[SUCCESS] $message', name: 'AppLogger');
  }

  static void warning(String message) {
    developer.log('[WARNING] $message', name: 'AppLogger');
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    developer.log(
      '[ERROR] $message',
      name: 'AppLogger',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void debug(String message) {
    developer.log('[DEBUG] $message', name: 'AppLogger');
  }
}

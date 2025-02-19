/// Different levels for logging.
enum LogLevel {
  debug,
  info,
  warning,
  severe;

  @override
  String toString() {
    return switch (this) {
      LogLevel.debug => 'DEBUG',
      LogLevel.info => 'INFO',
      LogLevel.warning => 'WARNING',
      LogLevel.severe => 'SEVERE',
    };
  }

  String get colorPrefix {
    return switch (this) {
      LogLevel.debug => '\x1B[0;32m',
      LogLevel.info => '\x1B[35m',
      LogLevel.warning => '\x1B[38;5;209m',
      LogLevel.severe => '\x1B[38;5;198m',
    };
  }

  String get colorSuffix {
    return switch (this) {
      LogLevel.debug => '\x1B[0m',
      LogLevel.info => '\x1B[0m',
      LogLevel.warning => '\x1B[0m',
      LogLevel.severe => '\x1B[0m',
    };
  }
}

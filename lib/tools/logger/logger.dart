import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:snake/tools/logger/log_tag.dart';

import 'logger_level.dart';

export 'log_tag.dart';

/// Class that logs to the console.
class Logger {
  Logger._() {
    FlutterError.onError = _recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      _recordError(error.toString(), stackTrace: stack, fatal: true);
      return true;
    };
  }

  static final instance = Logger._();

  void _recordFlutterError(FlutterErrorDetails details) {
    //TODO(Artur): Implement error reporting.
  }

  void _recordError(String message, {StackTrace? stackTrace, bool fatal = false}) {
    if (_reportErrors) {
      //TODO(Artur): Implement error reporting.
    }
  }

  static bool get _reportErrors => kDebugMode;

  /// Integer representation of the log level.
  static int _logLevelIntegerRepresentation(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.severe:
        return 1000;
    }
  }

  /// Get the full logging message.
  static String _fullLogMessage(String message, {required LogLevel level, required LogTag? category}) {
    final categoryString = category?.label ?? level.toString();
    final divider =
        ' ${level.colorPrefix}-------------------------------------------------------------------------${level.colorSuffix}';

    return '$divider\n${level.colorPrefix}| $categoryString |  $message${level.colorSuffix}\n$divider';
  }

  /// Emit a debug event.
  static void debug(
    String message, {
    StackTrace? stackTrace,
    LogTag? category,
  }) {
    if (_shouldLog(LogLevel.debug)) {
      final fullLogMessage = _fullLogMessage(message, level: LogLevel.debug, category: category);

      /// Log.
      developer.log(
        fullLogMessage,
        level: _logLevelIntegerRepresentation(LogLevel.debug),
        stackTrace: stackTrace,
      );

      instance._recordError(fullLogMessage, stackTrace: stackTrace);
    }
  }

  /// Emit an info event.
  static void info(
    String message, {
    StackTrace? stackTrace,
    LogTag? category,
  }) {
    if (_shouldLog(LogLevel.info)) {
      final fullLogMessage = _fullLogMessage(message, level: LogLevel.info, category: category);

      /// Log.
      developer.log(
        _fullLogMessage(message, level: LogLevel.info, category: category),
        level: _logLevelIntegerRepresentation(LogLevel.info),
        stackTrace: stackTrace,
      );
      instance._recordError(fullLogMessage, stackTrace: stackTrace);
    }
  }

  /// Emit a warning event.
  static void warning(
    String message, {
    StackTrace? stackTrace,
    LogTag? category,
  }) {
    if (_shouldLog(LogLevel.warning)) {
      /// Log.
      developer.log(
        _fullLogMessage(message, level: LogLevel.warning, category: category),
        level: _logLevelIntegerRepresentation(LogLevel.warning),
        stackTrace: stackTrace,
      );

      instance._recordError(_fullLogMessage(message, level: LogLevel.warning, category: category),
          stackTrace: stackTrace);
    }
  }

  /// Emit an error event.
  static void error(
    String message,
    StackTrace stackTrace, {
    LogTag? category,
  }) {
    if (_shouldLog(LogLevel.severe)) {
      /// Log.
      developer.log(
        _fullLogMessage(message, level: LogLevel.severe, category: category),
        level: _logLevelIntegerRepresentation(LogLevel.severe),
        stackTrace: stackTrace,
      );

      instance._recordError(_fullLogMessage(message, level: LogLevel.warning, category: category),
          stackTrace: stackTrace);
    }
  }

  /// The minimum `LogLevel` that needs to be logged by the app.
  /// Order: debug < info < warning < error.
  /// Error is (and should) always be logged.
  static LogLevel get _minimumLogLevel {
    if (kDebugMode) {
      return LogLevel.debug;
    } else {
      return LogLevel.warning;
    }
  }

  /// Whether or not a `LogLevel` needs to be logged.
  static bool _shouldLog(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return _minimumLogLevel == LogLevel.debug;
      case LogLevel.info:
        return [LogLevel.debug, LogLevel.info].contains(_minimumLogLevel);
      case LogLevel.warning:
        return [LogLevel.debug, LogLevel.info, LogLevel.warning].contains(_minimumLogLevel);
      case LogLevel.severe:
        return true;
    }
  }
}

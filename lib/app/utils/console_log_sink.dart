

import 'dart:async';
import 'dart:developer';
import 'dart:io';



import 'package:base_riverpod/app/utils/ilog_message_sink.dart';
import 'package:logging/logging.dart';

class ConsoleLogSink implements ILogMessageSink {
  // Properties

  StreamSubscription<LogRecord> _subscription;

  // Methods

  @override
  void attachToLogger(Logger logger) {
    assert(logger != null);

    _subscription = Logger.root.onRecord
        .listen(_logMessage, onDone: _handleOnDone, cancelOnError: true);
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  void _handleOnDone() {
    _subscription = null;
  }

  void _logMessage(LogRecord event) {
    if (Platform.isAndroid) {
      _logMessageColoredStyle(event);
    }
    else {
      _logMessageDefaultStyle(event);
    }
  }
  
  void _logMessageColoredStyle(LogRecord event) {
    Object logLevelText;

    if (event.level == Level.FINE ||
        event.level == Level.FINER ||
        event.level == Level.FINEST) {
      logLevelText = event.level.name;
    } else if (event.level == Level.INFO) {
      logLevelText = event.level.name;
    } else if (event.level == Level.WARNING) {
      logLevelText = event.level.name;
    } else if (event.level == Level.SEVERE || event.level == Level.SHOUT) {
      logLevelText = event.level.name;
    } else {
      logLevelText = event.level.name;
    }

    log(
        '[${event.time} - ${event.loggerName} - ${logLevelText.toString()}] ${event.message ?? event.object?.toString() ?? ""}');
  }

  void _logMessageDefaultStyle(LogRecord event) {
    final String logLevelText = event.level.name;
    log(
        '[${event.time} - ${event.loggerName} - $logLevelText] ${event.message ?? event.object?.toString() ?? ""}');
  }
}
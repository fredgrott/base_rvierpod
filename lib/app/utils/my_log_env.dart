// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'dart:async';
import 'dart:developer';

import 'package:base_riverpod/app/utils/build_modes.dart';
import 'package:base_riverpod/app/utils/console_log_sink.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

// we do not put a logger here to redefine log as we do that
// after this myLogSetUp executes as part of our 
// main function startup of the app.

// to initialize log environment for the app
void myLogSetUp() {
  // collect all logs
  Logger.root.level = Level.ALL;
  // set it up that all the child loggers below
  // root logger are related
  hierarchicalLoggingEnabled = true;

  if (isInDebugMode) {
    // set console sink and print appender only in debug mode
    final messageSink = ConsoleLogSink();
    messageSink.attachToLogger(Logger.root);
    PrintAppender(formatter: const ColorFormatter())
        .attachToLogger(Logger.root);
  }

  if (isInReleaseMode) {
    Logger.root.level = Level.OFF;
  }
}

mixin LogMixin on Object {
  String get _className => runtimeType.toString();
  void myAppLog(
    String message, {
    DateTime time,
    int sequenceNumber,
    // for this type of call dev needs to supply
    // a level int in their myAppLog statements
    // as it will not output under int value of
    // 0 and this item cannot be null in non root
    // loggers.
    int level = 0,
    String name,
    Zone zone,
    Object error,
    StackTrace stackTrace,
  }) {
    log(
      message,
      name: name ?? _className,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

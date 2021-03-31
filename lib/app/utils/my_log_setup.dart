// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.


import 'package:base_riverpod/app/utils/build_modes.dart';
import 'package:base_riverpod/app/utils/console_log_sink.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:fimber/fimber.dart';

// How Dart Flutter Logging Works:
//    Print methods are taken out of release builds
//    The Dart Logging Package sends the logs to an event stream
//    Output happens when a log appender is used to send out somewhere
//    The outputs are generally called sinks to keep in-line with how
//    sink terms work with all streams.
//
//    Thus the only extra code-wiring is when the plugins on top of
//    both Dart developer.log and the logging package leave something
//    out.  In this case the Fimber plugin does not account for the
//    developer.log name entity for tags(categories)  in it's
//    log output which then we can fake via a new logWithFimberTag function
//    but it will not have the nice parent-to-child dot format in naming.
//
//    To make sure I have everything covered I turn the root logger level to 
//    off during release mode which than also turns off the child loggers 
//    as well. App exceptions are mapped to 3rd party app exception 
//    collector during release modes so everything gets fully 
//    collected and curated.

void myLogSetUp() {
  Logger.root.level = Level.ALL;
  hierarchicalLoggingEnabled = true;
  final messageSink = ConsoleLogSink();
  messageSink.attachToLogger(Logger.root);
  // ignore: unused_local_variable
  final appender = PrintAppender.setupLogging(stderrLevel: Level.SEVERE);
  PrintAppender(formatter: const ColorFormatter()).attachToLogger(Logger.root);

  Fimber.plantTree(DebugTree.elapsed(useColors: true));

  if (isInReleaseMode) {
    Logger.root.level = Level.OFF;
  }
}

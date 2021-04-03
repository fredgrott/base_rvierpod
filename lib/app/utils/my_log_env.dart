// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'dart:async';
import 'dart:developer';

import 'package:ansicolor/ansicolor.dart';
import 'package:base_riverpod/app/utils/build_modes.dart';

import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:simple_logger/simple_logger.dart';

// A pet feeling, I hate when devs force other devs to
// refine a function of another package. I feel it's
// bonehead and impolite. Thus, instead of redefining the
// developer package log function to use logger out of the
// logging package per Google dev instructions I instead
// make use of simple logger that defines a singleton
// logger in the right way without the messy and rude
// redefine developer log function part.
//

// used in default root logger form
final logger = SimpleLogger();

// color log definitions, excluding black and white due to using dark mode
// in devtools
final penCyan = AnsiPen()..cyan(bold: true);
final penBlue = AnsiPen()..blue(bold: true);
final penRed = AnsiPen()..red(bold: true);
final penGreen = AnsiPen()..green(bold: true);
final penYellow = AnsiPen()..yellow(bold: true);
final penMagenta = AnsiPen()..magenta(bold: true);
final penWhite = AnsiPen()..white(bold: true);
final penBlack = AnsiPen()..black(bold: true);

// to initialize log environment for the app
void myLogSetUp() {
  // collect all logs
  //Logger.root.level = Level.ALL;
  //use the simple logger settings instead

  // set it up that all the child loggers below
  // root logger are related
  hierarchicalLoggingEnabled = true;

  if (isInDebugMode) {
    logger.setLevel(
      Level.INFO,
      // Includes  caller info, but this is expensive.
      includeCallerInfo: true,
    );

   
    PrintAppender(formatter: const ColorFormatter())
        .attachToLogger(Logger.root);
  }

  if (isInReleaseMode) {
    logger.setLevel(
      Level.OFF,
      // Includes  caller info, but this is expensive.
      includeCallerInfo: false,
    );
  }
  // reformat so we get nice colored logs
  logger.formatter = (info) => penCyan(info.message);
  logger.formatter = (shout) => penRed(shout.message);
  logger.formatter = (warning) => penYellow(warning.message);
  logger.formatter = (severe) => penMagenta(severe.message);
  logger.formatter = (finest) => penBlack(finest.message);
  logger.formatter = (finer) => penWhite(finer.message);
  logger.formatter = (fine) => penGreen(fine.message);
  logger.formatter = (config) => penBlue(config.message);
}

mixin LogMixin on Object {
  String get _className => runtimeType.toString();
  void myAppLog(
    String message, {
    DateTime time,
    int sequenceNumber,
    // sets default log level to INFO
    int level = 800,
    String name,
    Zone zone,
    Object error,
    StackTrace stackTrace,
  }) {
    log(
      // since the default level is INFO, color the log
      penCyan(message),
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

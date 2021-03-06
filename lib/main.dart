// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'dart:async';

import 'package:base_riverpod/app/modules/platformexp/views/my_platform_exp.dart';

import 'package:base_riverpod/app/utils/build_modes.dart';
import 'package:base_riverpod/app/utils/logging/init_log.dart';
import 'package:base_riverpod/app/utils/logging/log_exception.dart';
import 'package:base_riverpod/app/utils/logging/log_pens.dart';
import 'package:base_riverpod/app/utils/logging/logger_types.dart';

import 'package:catcher/catcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    initLog();
  } catch (error) {
    LogException("Main init failed");
  }

  // to enable sentry add this [SentryHandler(SentryClient("YOUR_DSN_HERE"))]
  // due to web as a target platform we do not set the snapshot path
  // setting for catcher
  final CatcherOptions debugOptions =
      // ignore: avoid_redundant_argument_values
      CatcherOptions(DialogReportMode(), [
    ConsoleHandler(
        // ignore: avoid_redundant_argument_values
        enableApplicationParameters: true,
        // ignore: avoid_redundant_argument_values
        enableDeviceParameters: true,
        enableCustomParameters: true,
        // ignore: avoid_redundant_argument_values
        enableStackTrace: true)
  ]);

  final CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["email1@email.com", "email2@email.com"],
        // ignore: avoid_redundant_argument_values
        enableDeviceParameters: true,
        // ignore: avoid_redundant_argument_values
        enableStackTrace: true,
        // ignore: avoid_redundant_argument_values
        enableCustomParameters: true,
        // ignore: avoid_redundant_argument_values
        enableApplicationParameters: true,
        // ignore: avoid_redundant_argument_values
        sendHtml: true,
        emailTitle: "Sample Title",
        emailHeader: "Sample Header",
        printLogs: true)
  ]);

  //logger.info("init completed");
  logAFunction("main in main.dart").info(penInfo(" main init completed"));

  // replaced with catcher plugin error widget in my_app.dart
  //ErrorWidget.builder = (FlutterErrorDetails details) {
  //if (isInDebugMode) {
  //return ErrorWidget(details.exception);
  // }

  //return Container(
  // alignment: Alignment.center,
  //  child: const Text(
  //   'Error!',
  //   style: TextStyle(color: Colors.yellow),
  //   textDirection: TextDirection.ltr,
  // ),
  //);
  //};

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // app exceptions provider. We do not need this in Profile mode.
      if (isInReleaseMode) {
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    }
  };

  runZonedGuarded<Future<void>>(
    () async {
      //runApp(MyApp());
      // via the catcher plugin
      Catcher(
          runAppFunction: () {
            runApp(
              ProviderScope(child: MyPlatformExperience()),
            );
          },
          debugConfig: debugOptions,
          releaseConfig: releaseOptions);
    },
    (error, stackTrace) async {
      await _reportError(error, stackTrace);
    },
    // yes we can redefine the zoneSpecification to intercept the print
    // calls and funnel them to log calls via the logger of simple logger
    zoneSpecification: ZoneSpecification(
      // Intercept all print calls
      print: (self, parent, zone, line) async {
        // Include a timestamp and the name of the App
        final messageToLog = "[${DateTime.now()}] Base_Riverpod $line $zone";

        // Also print the message in the "Debug Console"
        // but it's ony an info message and contains no
        // privacy prohibited stuff
        parent.print(zone, penInfo(messageToLog));
      },
    ),
  );
}

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  logger.info(
    'Caught error: $error',
  );
  // Errors thrown in development mode are unlikely to be interesting. You
  // check if you are running in dev mode using an assertion and omit send
  // the report.
  if (isInDebugMode) {
    logger.info(
      '$stackTrace',
    );
    logger
        .info('In dev mode. Not sending report to an app exceptions provider.');

    return;
  } else {
    // reporting error and stacktrace to app exceptions provider code goes here
    if (isInReleaseMode) {
      // code goes here
    }
  }
}

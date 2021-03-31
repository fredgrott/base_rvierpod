import 'dart:async';
import 'dart:developer';

import 'package:ansicolor/ansicolor.dart';
import 'package:base_riverpod/app/modules/myapp/my_app.dart';
import 'package:base_riverpod/app/utils/build_modes.dart';
import 'package:base_riverpod/app/utils/my_log_setup.dart';
import 'package:catcher/catcher.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  myLogSetUp();

  // to enable sentry add this [SentryHandler(SentryClient("YOUR_DSN_HERE"))]
  final CatcherOptions debugOptions =
      // ignore: avoid_redundant_argument_values
      CatcherOptions(DialogReportMode(), [ConsoleHandler(enableApplicationParameters: true,
          // ignore: avoid_redundant_argument_values
          enableDeviceParameters: true,
          enableCustomParameters: true,
          // ignore: avoid_redundant_argument_values
          enableStackTrace: true)]);

  
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

  final myMainLogger = FimberLog('main');

  myMainLogger.i("init completed");


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
        runApp( ProviderScope(child: MyApp()),);
      },
      debugConfig: debugOptions,
      releaseConfig: releaseOptions);
    },
    (error, stackTrace) async {
      await _reportError(error, stackTrace);
    },
    zoneSpecification: ZoneSpecification(
      // Intercept all print calls
      print: (self, parent, zone, line) async {
        // Paint all logs with Cyan color
        final pen = AnsiPen()..cyan(bold: true);
        // Include a timestamp and the name of the App
        final messageToLog = "[${DateTime.now()}] Log_Error $line";

        // Also print the message in the "Debug Console"
        parent.print(zone, pen(messageToLog));
        
      },
    ),
  );
}

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  log('Caught error: $error');
  // Errors thrown in development mode are unlikely to be interesting. You
  // check if you are running in dev mode using an assertion and omit send
  // the report.
  if (isInDebugMode) {
    log('$stackTrace');
    log('In dev mode. Not sending report to an app exceptions provider.');

    return;
  } else {
    // reporting error and stacktrace to app exceptions provider code goes here
    if (isInReleaseMode) {
      // code goes here
    }
  }
}

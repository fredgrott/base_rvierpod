// Modified from Logsinks by Sörnt Poppe
// https://github.com/soernt/logsinks
// MIT License
// Modifications by Fredrick Allan Grott 2021


import 'package:logging/logging.dart';

abstract class ILogMessageSink {
  /// Start listing to the logger.
  void attachToLogger(Logger logger);

  void dispose() {}
}
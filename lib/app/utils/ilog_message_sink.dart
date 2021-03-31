

import 'package:logging/logging.dart';

abstract class ILogMessageSink {
  /// Start listing to the logger.
  void attachToLogger(Logger logger);

  void dispose() {}
}
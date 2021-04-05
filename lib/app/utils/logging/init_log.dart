
import 'package:base_riverpod/app/utils/build_modes.dart';
import 'package:base_riverpod/app/utils/logging/log_pens.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:simple_logger/simple_logger.dart';




final logger = SimpleLogger();


void initLog() {
  hierarchicalLoggingEnabled = true;
  if (isInDebugMode) {
    logger.setLevel(
      Level.INFO,
      // Includes  caller info, but this is expensive.
      includeCallerInfo: true,
    );

    Logger.root.onRecord.listen((record) {
      if (record.error != null && record.stackTrace != null) {
        // ignore: avoid_print
        print('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}: ${record.error}: ${record.stackTrace}');
        // ignore: avoid_print
        print(
            'level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error} exception: ${record.stackTrace}');
      } else if (record.error != null) {
        // ignore: avoid_print
        print('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error}');
      } else {
        // ignore: avoid_print
        print('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message}');
      }
    });

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

  logger.formatter = (info) => penInfo(info.message);
  logger.formatter = (shout) => penShout(shout.message);
  logger.formatter = (warning) => penWarning(warning.message);
  logger.formatter = (severe) => penSevere(severe.message);
  logger.formatter = (finest) => penFinest(finest.message);
  logger.formatter = (finer) => penFiner(finer.message);
  logger.formatter = (fine) => penFine(fine.message);
  logger.formatter = (config) => penConfig(config.message);
}

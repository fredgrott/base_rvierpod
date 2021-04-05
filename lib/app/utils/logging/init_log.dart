import 'package:ansicolor/ansicolor.dart';
import 'package:base_riverpod/app/utils/build_modes.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:simple_logger/simple_logger.dart';


final penCyan = AnsiPen()..cyan(bold: true);
final penBlue = AnsiPen()..blue(bold: true);
final penRed = AnsiPen()..red(bold: true);
final penGreen = AnsiPen()..green(bold: true);
final penYellow = AnsiPen()..yellow(bold: true);
final penMagenta = AnsiPen()..magenta(bold: true);
final penWhite = AnsiPen()..white(bold: true);
final penBlack = AnsiPen()..black(bold: true);

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

  logger.formatter = (info) => penCyan(info.message);
  logger.formatter = (shout) => penRed(shout.message);
  logger.formatter = (warning) => penYellow(warning.message);
  logger.formatter = (severe) => penMagenta(severe.message);
  logger.formatter = (finest) => penBlack(finest.message);
  logger.formatter = (finer) => penWhite(finer.message);
  logger.formatter = (fine) => penGreen(fine.message);
  logger.formatter = (config) => penBlue(config.message);
}

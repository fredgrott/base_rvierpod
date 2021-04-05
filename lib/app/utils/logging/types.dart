




import 'package:logging/logging.dart';

abstract class LoggerType {
  Logger get logger;
}

extension LoggerSpawner  on LoggerType{
  Logger newLogger(String name) => Logger('${logger.fullName}.$name');

  
}
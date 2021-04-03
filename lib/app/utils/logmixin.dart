

import 'dart:async';

import 'dart:developer';

/// LogMixin to use with classes so it's damn simple to log debug feedback
/// Can call it via:
/// ```dart
/// class Something with LogMixin{
///   myAppLog(message: "logit", level: Level.INFO)
/// }
/// ```
/// Note that level is set to int of Zero or logging OFF as 
/// we want it in idiot mode in-case some clue-less dev 
/// fails to set up the logging package settings in the 
/// app init correctly have logging level set to 
/// zero in release builds. An example of the 
/// idiot proofing you should always do in your dev-tools 
/// and dev-ops habits.
/// 
/// @author Fredrick Allan Grott
mixin LogMixin on Object {
  String get _className => runtimeType.toString();
  void myAppLog(
    String message, {
      DateTime time,
      int sequenceNumber,
      int level=0,
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
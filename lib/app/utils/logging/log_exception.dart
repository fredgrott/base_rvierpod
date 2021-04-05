// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'dart:async';
import 'dart:developer';

import 'package:base_riverpod/app/utils/logging/log_pens.dart';





/// To make sure that we collect all expected and unexpected exceptions we
/// have to prevent log swallowing via the => log return problem
/// while at the same time make it somewhat easy to do Future await
/// paring code writing in an easy way to catch exceptions.
///
/// We can do this to cover both Futures and all functions if we have an
/// easy to use LogException method that we can use in the program main since
/// all exceptions both expected and unexpected are
/// bubbled up in dart.
///
/// The other part of this of course is the LogMixin as still effectively using
/// most functions in some type of class as we are still not fully into doing FP
/// in flutter. Well, at lest the pure kind.
///
/// @author Fredrick Allan Grott
class LogException {
  /// Message describing the
  final String message;
  final StackTrace stackTrace;
  final Zone zone;
  DateTime time;
  int level = 1000;
  final Object cause;
  LogException(this.message,
      {StackTrace stackTrace, this.cause, this.zone, this.level, this.time})
      : stackTrace = stackTrace ?? StackTrace.current {
    log(penWarning(
        "$message\n$stackTrace${cause != null ? "\nCaused by:\n$cause" : ""} in zone of $zone at level: $level on this $time"));
  }
}

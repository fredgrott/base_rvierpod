// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:base_riverpod/app/utils/logging/logger_types.dart';
import 'package:flutter/foundation.dart';

bool get isInDebugMode {
  // ignore: unused_local_variable
  bool _inDebugMode = false;

  logAFunction('isInDebugMode').info('kDebugMode is:$kDebugMode');

  return kDebugMode ? (_inDebugMode = true) : (_inDebugMode = false);
}

bool get isInReleaseMode {
  // ignore: unused_local_variable
  bool _inReleaseMode = false;

  return kReleaseMode ? (_inReleaseMode = true) : (_inReleaseMode = false);
}

bool get isInProfileMode {
  // ignore: unused_local_variable
  bool _inProfileMode = false;

  return kProfileMode ? (_inProfileMode = true) : (_inProfileMode = false);
}

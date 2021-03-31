// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'dart:async';


import 'package:golden_toolkit/golden_toolkit.dart';

// Configures both the widget tests and goldens via
// the eBay GoldenToolkit plugin.
// changed main to testExecutable per issue#72801 on fluter sdk // as docs not updated yet, see
// https://github.com/flutter/flutter/issues/72801
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
        () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(

      enableRealShadows: true,
    ),
  );
}
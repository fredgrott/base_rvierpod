// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// One should always use some type of middleware set-up to log 
// the changing states of the app for debugging purposes.

/// Call this after extending HookWidget by:
///```dart
/// final counter = useLoggedState(0);
/// ```
/// @author Fredrick Allan Grott
ValueNotifier<T> useLoggedState<T>([T initialData]) {
  // First, call the useState hook. It will create a ValueNotifier for you that
  // rebuilds the Widget whenever the value changes.
  final result = useState<T>(initialData);

  // Next, call the useValueChanged hook to print the state whenever it changes
  useValueChanged<T, void>(result.value, (_, __) {
    log(result.toString());
  });

  return result;
}